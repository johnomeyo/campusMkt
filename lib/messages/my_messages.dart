import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/alpha_widgets.dart';
import 'chat.dart';

class MyMessages extends StatelessWidget {
  const MyMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const MyBackButton(),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    "My Messages",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChatPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 1),
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://images.unsplash.com/photo-1530423470967-45b90dca3a4f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bGFkeXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
                                      fit: BoxFit.cover,
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Tessa Williams",
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("Aight! Lemme check it out",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
