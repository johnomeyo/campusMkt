// To parse this JSON data, do
//
//     final favoriteItemModel = favoriteItemModelFromJson(jsonString);

import 'dart:convert';

FavoriteItemModel favoriteItemModelFromJson(String str) =>
    FavoriteItemModel.fromJson(json.decode(str));

String favoriteItemModelToJson(FavoriteItemModel data) =>
    json.encode(data.toJson());

class FavoriteItemModel {
  String id;
  String name;
  String price;
  String imageUrl;

  FavoriteItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory FavoriteItemModel.fromJson(Map<String, dynamic> json) =>
      FavoriteItemModel(
        name: json["name"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "imageUrl": imageUrl,
      };
}
