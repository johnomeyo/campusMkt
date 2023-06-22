import 'package:campus_market_place/messages/my_messages.dart';
import 'package:campus_market_place/tabs/favorites.dart';
import 'package:campus_market_place/tabs/home.dart';
import 'package:campus_market_place/tabs/profile.dart';
import 'package:campus_market_place/tabs/upload.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    const HomePage(),
    const Favorites(),
    const UploadPage(),
    const MyMessages(),
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
          tabBackgroundColor: Colors.grey.shade100,
          color: Colors.grey.shade700,
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              iconColor: Colors.grey.shade300,
            ),
            GButton(
              icon: Icons.favorite_outline,
              iconColor: Colors.grey.shade300,
            ),
            GButton(
              icon: Icons.add,
              iconColor: Colors.grey.shade300,
            ),
            GButton(
              icon: Icons.chat_outlined,
              iconColor: Colors.grey.shade300,
            ),
            GButton(
              icon: Icons.person_outline,
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
