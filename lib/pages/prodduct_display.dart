import 'package:campus_market_place/components/alpha_widgets.dart';
import 'package:campus_market_place/messages/my_messages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/products.dart';
import '../payment/payment_page.dart';

class ProductDisplayPage extends StatelessWidget {
  const ProductDisplayPage({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(20),
                    bottomEnd: Radius.circular(20)),
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(product.imageUrl
                        // "https://images.unsplash.com/photo-1553545985-1e0d8781d5db?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=394&q=80"
                        ),
                    fit: BoxFit.cover)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyBackButton(),
                  MyFavoriteIcon(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: GoogleFonts.abhayaLibre(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 30)),
                ),
                Text(
                  product.price,
                  style: GoogleFonts.abhayaLibre(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 30)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductQualitiesTile(
                  quality: 'size',
                  value: product.size,
                ),
                ProductQualitiesTile(
                  quality: 'heel',
                  value: product.mileage,
                ),
                ProductQualitiesTile(
                  quality: 'width',
                  value: product.width,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                // "I sell comfortable autumn boots. I have only worn them for one season so they are in good condition. Ready To sell for your price.",
                product.description,
                style: GoogleFonts.adamina(
                  textStyle: const TextStyle(fontSize: 15, letterSpacing: 1),
                )),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Buy now button
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text("Buy now",
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      )),
                ),
              ),
            ),
            //chat with the seller button
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyMessages()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text("Chat with seller",
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
