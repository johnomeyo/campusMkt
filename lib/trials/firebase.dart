import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'basketModel.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  List<BasketItem> basketItems = [];
  final collectionName = "basket_items";
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    fetchRecord();
    //listens to any changes in the collection
    FirebaseFirestore.instance
        .collection(collectionName)
        .snapshots()
        .listen((records) {
      mappedRecords(records);
    });
    super.initState();
  }

  fetchRecord() async {
    var records =
        await FirebaseFirestore.instance.collection(collectionName).get();
    mappedRecords(records);
  }

  mappedRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var list = records.docs
        .map((basketIem) => BasketItem(
            id: basketIem.id,
            name: basketIem['name'],
            quantity: basketIem['quantity']))
        .toList();

    setState(() {
      basketItems = list;
    });
  }

//add items to basket
  addToBasket(String name, String quantity) async {
    final item = BasketItem(id: "id", name: name, quantity: quantity);
    await FirebaseFirestore.instance
        .collection(collectionName)
        .add(item.toJson());
  }

  deleteItem(String id) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(id)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple.shade300,
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AlertDialog(
                                content: Column(
                                  children: [
                                    const Text(
                                      "Add item to basket",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 20),
                                    ),
                                    TextField(
                                      controller: nameController,
                                    ),
                                    TextField(
                                      controller: quantityController,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        addToBasket(
                                          nameController.text.trim(),
                                          quantityController.text.trim(),
                                        );
                                        
                                        Navigator.pop(context);
                                      },
                                      child: const Text("add"),
                                    )
                                  ],
                                ),
                              ),
                            ));
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          body: SizedBox(
            height: 500,
            child: ListView.builder(
                itemCount: basketItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(basketItems[index].name),
                    subtitle: Text(basketItems[index].quantity ?? ""),
                    trailing: IconButton(
                        onPressed: () {
                          deleteItem(basketItems[index].id);
                        },
                        icon: const Icon(Icons.delete)),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
