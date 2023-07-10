class FavoriteItemModel {
  final String name;
  final String imageurl;
  final String price;
  bool fav;
  FavoriteItemModel({required this.name, required this.imageurl, required this.price, this.fav =false});
}
