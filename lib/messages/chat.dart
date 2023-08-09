import 'package:campus_market_place/components/alpha_widgets.dart';
import 'package:campus_market_place/messages/sent_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final mesageController = TextEditingController();
  addSubcollection(
    String id,
  ) async {
    final parentRef = FirebaseFirestore.instance.collection("users").doc(id);
    final subCollectionRef = parentRef.collection("conversations");
    subCollectionRef.add({});
  }

  sendMessage(String message) async {
    var messageId = FirebaseAuth.instance.currentUser!.email;
    final parentRef =
        FirebaseFirestore.instance.collection("users").doc(messageId);
    final subCollectionRef = parentRef.collection("conversations");
    final parentDocRef = await subCollectionRef.add({
      "field1": "value1",
      "field2": "value2",
    });
    final messagesCollectionRef = parentDocRef.collection("messages");
    await messagesCollectionRef.add({
      "text": message,
      "messageId": messageId,
    });
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("messages").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Error loading messages");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            }
            var docs = snapshot.data!.docs;
            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  if (docs[index]['messageId'] ==
                      FirebaseAuth.instance.currentUser!.email) {
                    return SentMessage(text: docs[index]['text']);
                  } else {
                    return ReceivedMessage(text: docs[index]['text']);
                  }
                });
          }),
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
                  if (mesageController.text.isNotEmpty) {
                    sendMessage(mesageController.text);
                    mesageController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Message cant be empty")));
                  }
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
//users collection that has the logged in users
//create a subcollection called conversations; that has the individual messages``