import 'package:campus_market_place/components/alpha_widgets.dart';
import 'package:campus_market_place/messages/sent_message.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 8,bottom: 10),
          child: MyBackButton(),
        ),
        centerTitle: true,
        title:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Tessa Williams",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "online",
              style: TextStyle(color: Colors.grey.shade200,),
            ),
          ],
        ),
        actions: const [ Padding(
          padding: EdgeInsets.only(right: 8,bottom: 10),
          child: CallButton(),
        ),],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SentMessage(text: "hello"),
              ReceivedMessage(text: "Hey bro"),
              SentMessage(text: "I want theses shoes"),
              ReceivedMessage(
                  text: "They go for ksh. 450 but how much can you offer?"),
              SentMessage(text: "I only have Ksh.300"),
              ReceivedMessage(text: "Woo!! That's low but it's fine"),
              SentMessage(text: "How do I make the payment though?"),
              ReceivedMessage(text: "You can make the payments either way"),
              ReceivedMessage(text: "Bank or Mpesa; any of the two"),
              ReceivedMessage(text: "Here's my Mpesa number\n0769047060"),
              SentMessage(text: "Alright! I'll go for Mpesa😂"),
              SentMessage(text: "hello"),
              ReceivedMessage(text: "Hey bro"),
              SentMessage(text: "I want theses shoes"),
              ReceivedMessage(
                  text: "They go for ksh. 450 but how much can you offer?"),
              SentMessage(text: "I only have Ksh.300"),
              ReceivedMessage(text: "Woo!! That's low but it's fine"),
              SentMessage(text: "How do I make the payment though?"),
              ReceivedMessage(text: "You can make the payments either way"),
              ReceivedMessage(text: "Bank or Mpesa; any of the two"),
              ReceivedMessage(text: "Here's my Mpesa number\n0769047060"),
              SentMessage(text: "Alright! I'll go for Mpesa😂"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          hintText: "Write a message...",
                          hintStyle: TextStyle(color: Colors.grey.shade500)),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_upward_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
