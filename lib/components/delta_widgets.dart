import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadPageTextBox extends StatelessWidget {
  const UploadPageTextBox(
      {super.key,
      required this.field,
      required this.hintText,
      required this.fieldController});
  final String field;
  final String hintText;
  final TextEditingController fieldController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    field,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: hintText, border: InputBorder.none),
                controller: fieldController,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UploadPostButton extends StatelessWidget {
  const UploadPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "Upload Post",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: const TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
