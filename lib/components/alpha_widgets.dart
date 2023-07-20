import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/favorite_item_model.dart';
import '../trials/basketModel.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Center(
            child: Icon(
          Icons.arrow_back,
          color: Colors.grey.shade500,
        )),
      ),
    );
  }
}

class MyFavoriteIcon extends StatefulWidget {
  const MyFavoriteIcon({super.key});

  @override
  State<MyFavoriteIcon> createState() => _MyFavoriteIconState();
}

class _MyFavoriteIconState extends State<MyFavoriteIcon> {
  bool fav = false;
  addToFavorites() async {
    var firestoreInstance = FirebaseFirestore.instance.collection("favorites");
    var favItem = FavoriteItemModel(
      id: "id",
      name: "Jordan 4",
      price: "Ksh. 4000",
      imageUrl:
          "https://images.unsplash.com/photo-1589831377283-33cb1cc6bd5d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhcHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
    );
    await firestoreInstance.add(favItem.toJson());
  }
  // addToBasket(String name, String quantity) async {
  //   final item = BasketItem(id: "id", name: name, quantity: quantity);

  //   await FirebaseFirestore.instance.collection('basket_items').add(item.toJson());
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          fav = !fav;
          if (fav = true) {
            // addToBasket("Airforce 1", "size 42");
            //addToFavorites();
          }
        });
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: fav
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border)),
      ),
    );
  }
}

class ProductQualitiesTile extends StatelessWidget {
  const ProductQualitiesTile(
      {super.key, required this.quality, required this.value});
  final String quality;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200)),
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          quality,
          style: const TextStyle(fontSize: 15, color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w600),
        ),
      ]),
    );
  }
}

class CallButton extends StatelessWidget {
  const CallButton({super.key});
  void call() {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: call,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
          color: Colors.white,
        ),
        child: Center(
            child: Icon(
          Icons.call_outlined,
          color: Colors.grey.shade500,
        )),
      ),
    );
  }
}
