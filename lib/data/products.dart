class Product {
  String name;
  String price;
  String sellerName;
  String size;
  String mileage;
  String width;
  String description;
  String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.sellerName,
    required this.size,
    required this.mileage,
    required this.width,
    required this.description,
    required this.imageUrl,
  });
}

List<Product> products = [
  Product(
      name: "Autumn Shoes",
      price: "Ksh 1400",
      sellerName: "Tessa Williams",
      size: "9.5",
      mileage: "2 mths",
      width: "5cm",
      description:
          "I sell comfortable autumn boots. I have only worn them for one season so they are in good condition. Ready To sell for your price.",
      imageUrl:
          "https://images.unsplash.com/photo-1553545985-1e0d8781d5db?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=394&q=80")
];
