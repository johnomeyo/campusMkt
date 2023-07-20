import 'package:campus_market_place/models/favorite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<FavoriteItemModel> favoriteItems = [
    FavoriteItemModel(
        id: "id",
        name: "Jordan 3",
        price: "Ksh 4500",
        imageUrl:
            "https://images.unsplash.com/photo-1646747794382-7f3284527d42?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"),
                FavoriteItemModel(
        id: "id",
        name: "Jordan 4",
        price: "Ksh 5500",
        imageUrl:
            "https://images.unsplash.com/photo-1646747794382-7f3284527d42?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"),
  ];

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
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          
                          title: Text(favoriteItems[index].name),
                          leading: Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(favoriteItems[index].imageUrl),fit: BoxFit.cover)),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  favoriteItems.remove(favoriteItems[index]);
                                });
                              },
                              
                              icon: const Icon(Icons.delete)),
                        ),
                      ),
                    ),
                  );
                }));
  }
}
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
  