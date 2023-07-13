import 'package:campus_market_place/components/epsilon_widgets.dart';
import 'package:campus_market_place/data/products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Back",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 50)),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 30,
                            child: Image.asset(
                              "assets/oops.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Francis Hardy",
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("0729822061",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey.shade500)),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const PaymentOption(),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        product.price,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 70, fontWeight: FontWeight.w900)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        product.name,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900)),
                      ),
                      const Spacer(),
                      const Charges()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
