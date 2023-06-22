import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/user_info_page.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text("Profile",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade200,
              child: Icon(
                Icons.person,
                color: Colors.grey.shade600,
                size: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Jax Briggs",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              user.email.toString(),
              style: TextStyle(color: Colors.grey.shade500),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightGreenAccent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                    child: Text("Edit Profile",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserDataDisplay()));
                },
                child: const Text("Information"))
          ],
        ),
      ),
    ));
  }
}
