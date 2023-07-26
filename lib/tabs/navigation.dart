import 'package:campus_market_place/messages/my_messages.dart';
import 'package:campus_market_place/tabs/favorites.dart';
import 'package:campus_market_place/tabs/home.dart';
import 'package:campus_market_place/tabs/profile.dart';
import 'package:campus_market_place/tabs/upload.dart';
import 'package:campus_market_place/trials/chat_trial.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

FirebaseFirestore firestore = FirebaseFirestore.instance;
String? userEmail = FirebaseAuth.instance.currentUser?.email;

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    const HomePage(),
    const Favorites(),
    const UploadPage(),
    ChatScreen(
      currentUserUid: userEmail!,
    ),
    const UserProfile(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: SafeArea(
        child: GNav(
          iconSize: 24,
          gap: 8,
          activeColor: Colors.black,
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey.shade200,
          color: Colors.red,
          tabs: [
            GButton(
              icon: FontAwesomeIcons.house,
              iconColor: Colors.grey.shade300,
            ),
            GButton(
              icon: FontAwesomeIcons.heart,
              iconColor: Colors.grey.shade300,
            ),
            GButton(
              icon: FontAwesomeIcons.plus,
              iconColor: Colors.grey.shade300,
            ),
            GButton(
              icon: FontAwesomeIcons.message,
              iconColor: Colors.grey.shade300,
            ),
            GButton(
              icon: FontAwesomeIcons.user,
              iconColor: Colors.grey.shade300,
            ),
          ],
          selectedIndex: selectedIndex,
          onTabChange: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
