import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UserProfileWidgets extends StatelessWidget {
  UserProfileWidgets(
      {super.key, required this.text, required this.onTap, required this.icon});
  final String text;
  final IconData icon;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  icon,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const Spacer(),
            const Icon(Icons.navigate_next)
          ],
        ),
      ),
    );
  }
}

class MyTextBox extends StatelessWidget {
  const MyTextBox(
      {super.key,
      required this.text,
      required this.sectionName,
      required this.onPressed});
  final String text;
  final String sectionName;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(sectionName,style: TextStyle(color: Colors.grey.shade400,fontSize: 15),),
                  IconButton(
                      onPressed: onPressed, icon: const Icon(Icons.settings))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(text,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
