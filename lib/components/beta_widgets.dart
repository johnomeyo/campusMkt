import 'package:flutter/material.dart';

class LoginOptionTile extends StatelessWidget {
  const LoginOptionTile({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200)),
      height: 80,
      width: 80,
      child: Center(
          child: Image.asset(
        imageUrl,
        height: 50,
        width: 50,
      )),
    );
  }
}
