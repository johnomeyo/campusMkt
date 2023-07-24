import 'package:campus_market_place/models/favorite_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<FavoriteItemModel> favoriteItems = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot snapshot = await firestore.collection('favorites').get();

      List<FavoriteItemModel> favoritesList = snapshot.docs
          .map((doc) =>
              FavoriteItemModel.fromJson(doc.data() as Map<String, dynamic>?))
          .toList();

      setState(() {
        favoriteItems = favoritesList;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  void deleteItem(String itemId) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('favorites').doc(itemId).delete();

      // After deleting the item, fetch the updated list of favorites
      fetchData();
    } catch (e) {
      print("Error deleting item: $e");
    }
  }

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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Text(favoriteItems[index].name),
                          leading: Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        favoriteItems[index].imageUrl),
                                    fit: BoxFit.cover)),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                // setState(() {
                                //   favoriteItems.remove(favoriteItems[index]);
                                // });
                                deleteItem(favoriteItems[index].id);
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
