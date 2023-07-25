import 'package:campus_market_place/components/alpha_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final mesageController = TextEditingController();

  void sendMessage(String message) async {
    try {
      var firebase = FirebaseFirestore.instance.collection("messages");
      await firebase.add({
        "text": message,
      });
      print("message sent successfully");
    } catch (e) {
      print("error ${e.toString()}");
    }
  }

  void fetchMessages() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference messagesCollection = firestore.collection('messages');

    messagesCollection.get().then((querySnapshot) {
      if (querySnapshot.size > 0) {
        // Loop through the documents and access the data
        querySnapshot.docs.forEach((document) {
          // Explicitly cast the data to Map<String, dynamic>
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          // Example: Accessing the 'message' field
          String message = data['message'];
          print("Message: $message");
        });
      } else {
        print("No messages found.");
      }
    }).catchError((error) {
      print("Error getting messages: $error");
    });
  }

  @override
  void initState() {
    fetchMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.only(left: 8, bottom: 10),
            child: MyBackButton(),
          ),
          centerTitle: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Tessa Williams",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "online",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8, bottom: 10),
              child: CallButton(),
            ),
          ],
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [],
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
                      controller: mesageController,
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
              child: GestureDetector(
                onTap: () {
                  sendMessage(mesageController.text);
                },
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
