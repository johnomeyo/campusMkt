import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  // 
  bool fav = false;
void addToFavorites(Product product) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Create a new FavoriteItemModel instance using the properties of the Product
    FavoriteItemModel newItem = FavoriteItemModel(
      id: "product.id",
      name: product.name,
      price: product.price,
      imageUrl: product.imageUrl,
    );

    Map<String, dynamic> itemData = newItem.toJson();

    // Get the current user's email 
    String? userEmail = FirebaseAuth.instance.currentUser?.email;
    if (userEmail == null) {
      print("User not authenticated");
      return;
    }

    // Use the user's email as the document ID in the "users" collection
    DocumentReference userRef = firestore.collection('users').doc(userEmail);

    // Create or access the "favorites" subcollection for the user
    CollectionReference favoritesCollection = userRef.collection('favorites');

    // Add the new item to the "favorites" subcollection
    await favoritesCollection.add(itemData);
setState(() {
      fav = true;
    });
    Fluttertoast.showToast(
      msg: "Successfully added to favorites",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error adding item to collection: $e")),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          fav = !fav;
          if (fav = true) {}
          addToFavorites(widget.product);
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
