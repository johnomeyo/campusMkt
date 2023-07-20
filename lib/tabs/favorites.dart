import 'package:campus_market_place/models/favorite_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../trials/basketModel.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<FavoriteItemModel> favoriteItems = [];
  // @override
  // void initState() {
  //   // fetchFavorites();
  //   FirebaseFirestore.instance
  //       .collection('favorites')
  //       .snapshots()
  //       .listen((favorites) {
  //     mapFavorites(favorites);
  //   });
  //   super.initState();
  // }

  // fetchFavorites() async {
  //   var favorites =
  //       await FirebaseFirestore.instance.collection('favorites').get();
  //   mapFavorites(favorites);
  // }

  // removeFav(String id) async {
  //   FirebaseFirestore.instance.collection("favorites").doc(id).delete();
  // }

  // mapFavorites(QuerySnapshot<Map<String, dynamic>> favorites) async {
  //   var list = favorites.docs
  //       .map((favoriteItem) => FavoriteItemModel(
  //             id: favoriteItem.id,
  //             name: favoriteItem['name'],
  //             price: favoriteItem['price'],
  //             imageUrl: favoriteItem['imageUrl'],
  //           ))
  //       .toList();
  //   setState(() {
  //     favoriteItems = list;
  //   });
  // }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Favorites",
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        body: favoriteItems.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/oops.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Oops!! You haven't added something to your favorites yet.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemCount: favoriteItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(favoriteItems[index].name),
                    trailing: IconButton(
                        onPressed: () {
                          // removeFav(favoriteItems[index].id);
                        },
                        icon: const Icon(Icons.delete)),
                  );
                }));
  }
}
