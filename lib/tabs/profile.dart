import 'package:campus_market_place/components/gamma_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              height: 20,
            ),
            Text("Profile",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
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
              '@${user.email}',
              style: TextStyle(color: Colors.grey.shade500),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade800,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                    child: Text("Edit Profile",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Divider(),
            ),
            UserProfileWidgets(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            UserProfileWidgets(
              icon: Icons.info,
              text: 'Information',
              onTap: () {},
            ),
            const Spacer(),
            UserProfileWidgets(
              icon: Icons.logout,
              text: 'Login',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Log Out',
                        style: TextStyle(color: Colors.red),
                      ),
                      content: const Text('Are you sure you want to log out?'),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); 
                                },
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  FirebaseAuth.instance
                                      .signOut(); 
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.red,fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}