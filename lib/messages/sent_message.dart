import 'package:flutter/material.dart';

class SentMessage extends StatelessWidget {
  const SentMessage({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 200,
          ),
          child: Container(
            // width: 200,
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child:  Padding(
              padding:const EdgeInsets.all(8.0),
              child: Text(text),
            ),
          ),
        ),
      ),
    );
  }
}
class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({super.key, required this.text});

   final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 200,
          ),
          child: Container(
            // width: 200,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child:  Padding(
              padding:const EdgeInsets.all(8.0),
              child: Text(text,style: const TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ),
    );
  }
}