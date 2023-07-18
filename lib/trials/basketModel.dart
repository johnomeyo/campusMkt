

import 'dart:convert';

BasketItem basketItemFromJson(String str) => BasketItem.fromJson(json.decode(str));

String basketItemToJson(BasketItem data) => json.encode(data.toJson());

class BasketItem {
    String id;
    String name;
    String ?quantity;

    BasketItem({
       required this.id,
        required this.name,
        this.quantity,
    });

    factory BasketItem.fromJson(Map<String, dynamic> json) => BasketItem(
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quantity": quantity,
    };
}
