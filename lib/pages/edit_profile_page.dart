import 'package:campus_market_place/components/gamma_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final userCollection = FirebaseFirestore.instance.collection("users");
  String selectedPath = "";
  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  Future<void> editField(String field) async {
    String newValue = "";

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade300,
        title: Text(
          "Edit $field",
          style: GoogleFonts.lato(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        content: TextField(
          autofocus: true,
          decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20))),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel")),
          TextButton(
              onPressed: () => Navigator.of(context).pop(newValue),
              child: const Text("Save")),
        ],
      ),
    );
    //update the firestore if the user enters a new data
    if (newValue.trim().isNotEmpty) {
      await userCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[300],
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          centerTitle: true,
          title: Text("Edit Profile",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(currentUser.email!)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey.shade200,
                      child: Stack(children: [
                        const Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 50,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectedPath = await selectImageFromGallery();
                            if (selectedPath != "") {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("No image selected")));
                            }
                          },
                          child: const Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(currentUser.email!),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            "My details",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextBox(
                        text: userData['full name'],
                        sectionName: "Full Name",
                        onPressed: () => editField("full name")),
                    MyTextBox(
                        text: userData['location'],
                        sectionName: "Location",
                        onPressed: () => editField("location")),
                    MyTextBox(
                        text: userData['email'],
                        sectionName: "Email",
                        onPressed: () => editField("email")),
                    MyTextBox(
                        text: userData['password'],
                        sectionName: "Password",
                        onPressed: () => editField("password")),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error${snapshot.error}"),
              );
            }
            return const CircularProgressIndicator();
          },
        ));
  }
}
