import 'package:campus_market_place/components/gamma_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/edit_profile_page.dart';
import '../pages/user_info_page.dart';
import '../trials/firebase.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final user = FirebaseAuth.instance.currentUser!;
  String getCurrentUserId() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    }
    return '';
  }

  createCollection() async {
    try {
      // Get the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Create the 'favorites' collection
      await firestore.collection('nerds').add({
        'name':
            'Sample Favorite', // Replace this with the actual name you want to set
        'quantity': 10, // Replace this with the actual quantity you want to set
      });

      print(
          "Collection 'favorites' with fields 'name' and 'quantity' created successfully!");
    } catch (e) {
      print("Error creating collection: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SafeArea(
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
                        child: GestureDetector(
                          onTap: () {
                            // ignore: void_checks
                            return createCollection();
                          },
                          child: Icon(
                            Icons.person,
                            color: Colors.grey.shade600,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => YourScreen()));
                          },
                          child: const Text("check")),
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
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EditProfilePage())),
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Basket()));
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      UserProfileWidgets(
                        icon: Icons.info,
                        text: 'Information',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserInfoPagae()));
                        },
                      ),
                      const Spacer(),
                      UserProfileWidgets(
                        icon: Icons.logout,
                        text: 'Log Out',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  'Log Out',
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: const Text(
                                    'Are you sure you want to log out?'),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                        const Spacer(),
                                        TextButton(
                                          onPressed: () {
                                            FirebaseAuth.instance.signOut();
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20),
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
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class Favorite {
  String name;
  int quantity;

  Favorite({required this.name, required this.quantity});

  // Create a factory constructor to convert Firestore data into a Favorite object
  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      name: map['name'] ?? '', // Provide a default value in case of null
      quantity: map['quantity'] ?? 0, // Provide a default value in case of null
    );
  }
}

class YourScreen extends StatefulWidget {
  @override
  _YourScreenState createState() => _YourScreenState();
}

class _YourScreenState extends State<YourScreen> {
  // Create an empty list to hold the favorites
  List<Favorite> favoritesList = [];

  // Fetch data from Firestore and update the favoritesList
  void fetchData() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot snapshot = await firestore.collection('nerds').get();

      List<Favorite> favorites = snapshot.docs
          .map((doc) => Favorite.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      setState(() {
        favoritesList = favorites;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites List')),
      body: ListView.builder(
        itemCount: favoritesList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoritesList[index].name),
            subtitle:
                Text('Quantity: ${favoritesList[index].quantity.toString()}'),
          );
        },
      ),
    );
  }
}
