import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/products.dart';
import '../models/favorite_item_model.dart';

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
  const MyFavoriteIcon({super.key, required this.product});
  final Product product;
  @override
  State<MyFavoriteIcon> createState() => _MyFavoriteIconState();
}

class _MyFavoriteIconState extends State<MyFavoriteIcon> {
  FavoriteItemModel newItem = FavoriteItemModel(
  id: '3',
  name: 'New Item',
  price: '30.00',
  imageUrl: 'https://plus.unsplash.com/premium_photo-1670509096112-995f9414ca01?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1032&q=80', 
);
  bool fav = false;
  void addToFavorites(FavoriteItemModel newItem) async {
    try {
      // Get the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Create a map from the new item using toJson() method
      Map<String, dynamic> itemData = newItem.toJson();

      // Add the new item to the 'favorites' collection
      await firestore.collection('favorites').add(itemData);

      print("New item added to 'favorites' collection successfully!");
    } catch (e) {
      print("Error adding item to collection: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          fav = !fav;
          // if (fav = true) {}
        });
        addToFavorites(newItem);
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
