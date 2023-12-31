// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:campus_market_place/components/delta_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final sizeController = TextEditingController();
  final mileageController = TextEditingController();
  final measurementController = TextEditingController();
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

  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  // uploadPost() async {
  //   await FirebaseFirestore.instance.collection("posts").add();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Create a post",
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.check_circle,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      child: selectedPath == ""
                          ? GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text(
                                            "Choose an image from...!!!",
                                            style: GoogleFonts.lato(
                                                textStyle: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          content: SingleChildScrollView(
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    selectedPath =
                                                        await selectImageFromGallery();
                                                    if (selectedPath != "") {
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                                  content: Text(
                                                                      "No image selected")));
                                                    }
                                                  },
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                          "assets/gallery.png",
                                                          height: 100,
                                                          width: 100,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 10),
                                                          child: Text(
                                                            'Gallery',
                                                            style: GoogleFonts.lato(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    await selectImageFromCamera();
                                                    if (selectedPath != "") {
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                                  content: Text(
                                                                      "No image selected")));
                                                    }
                                                  },
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                          "assets/camera.png",
                                                          height: 100,
                                                          width: 100,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 10),
                                                          child: Text(
                                                            'Camera',
                                                            style: GoogleFonts.lato(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/post.png"),
                                  const Text("Upload image"),
                                ],
                              ),
                            )
                          : Image.file(
                              File(selectedPath),
                              fit: BoxFit.cover,
                            )),
                ),
              ),
              UploadPageTextBox(
                field: 'Title',
                fieldController: titleController,
                hintText: 'Enter the name or title of the item',
              ),
              UploadPageTextBox(
                field: 'Description',
                fieldController: descriptionController,
                hintText: 'Give a brief description of the item.',
              ),
              UploadPageTextBox(
                field: 'Price',
                fieldController: priceController,
                hintText: 'How much is the item?',
              ),
              UploadPageTextBox(
                field: 'Size',
                fieldController: sizeController,
                hintText: 'What is the size of the item',
              ),
              UploadPageTextBox(
                field: 'Mileage',
                fieldController: mileageController,
                hintText: 'Is the product new? If not specify the mileage',
              ),
              UploadPageTextBox(
                field: 'Measurements',
                fieldController: measurementController,
                hintText: 'Provide any relevant measurements of the item.',
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context, builder: (context) => const AlertDialog(
                        content: Text("Upload post?"),
                      ));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: UploadPostButton(text: "Upload Post"),
                ),
              )
            ],
          ),
        ));
  }
}
