import 'package:campus_market_place/components/alpha_widgets.dart';
import 'package:campus_market_place/pages/prodduct_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: const Text("L")),
                  Text("Hello ,${user.email!}",
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Let's start shopping",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.grey.shade500),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnPhgNI2O9F8zSaU2fXAy0_rHObO3367kT6g&usqp=CAU"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CRAZY COLLECTION",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("For you",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: GridView.builder(
                      itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductDisplayPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPjyzR9nEjRPrUwJxbGxbGbaFp5WeDv4N75w&usqp=CAU"),
                                    fit: BoxFit.cover),
                                color: Colors.pink.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            height: 200,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MyFavoriteIcon(),
                                    ],
                                  ),
                                ),
                                Center(child: Text(index.toString())),
                              ],
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
