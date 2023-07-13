import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentOption extends StatelessWidget {
  const PaymentOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 70,
              height: 50,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/card.png"), fit: BoxFit.cover)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Travel card",
                  style: GoogleFonts.lato(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 20)),
                ),
                Text(
                  "Mastercard -3356",
                  style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(color: Colors.grey.shade600, fontSize: 15)),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}

class Charges extends StatelessWidget {
  const Charges({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(10)),
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Row(
            children: [
              Icon(Icons.info,color: Colors.grey.shade900,),
              const Text("Bank rates (2.5) will be applied",style:TextStyle(color: Colors.black,fontSize: 15),),
            ],
          ),
        ));
  }
}
