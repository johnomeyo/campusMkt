import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;

  const ChatScreen({super.key, required this.chatId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  void sendMessage(String chatId, String messageText, String sender) {
    FirebaseFirestore.instance
        .collection('messages')
        .doc(chatId)
        .collection('chats')
        .add({
      'content': messageText,
      'sender': sender,
      'timestamp': FieldValue.serverTimestamp(),
    }).then((value) {
      // Optional: You can add a callback here to handle success (if needed).
      print('Message sent successfully!');
    }).catchError((error) {
      // Optional: You can add a callback here to handle errors (if needed).
      print('Error sending message: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Room'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .doc(widget.chatId)
                  .collection('chats')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<DocumentSnapshot> messages = snapshot.data!.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    Message message = Message.fromFirestore(
                        messages[index].data()! as Map<String, dynamic>);
                    return ListTile(
                      title: Text(message.content),
                      subtitle: Text(message.sender),
                      // Add more UI elements based on your chat message design
                    );
                  },
                );
              },
            ),
          ),
          // Add a text input and send button for users to send messages
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                width: 300,
                child: TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter a message...',
                      contentPadding: EdgeInsets.all(10)),
                  controller: messageController,
                )),
            IconButton(
                onPressed: () {
                  if (messageController.text.isNotEmpty) {
                    sendMessage(widget.chatId, messageController.text,
                        'John'); // Replace 'SenderName' with the actual sender's name or ID
                    messageController
                        .clear(); // Clear the input field after sending the message
                  }
                },
                icon: const Icon(
                  Icons.arrow_circle_up,
                  size: 40,
                ))
          ],
        ),
      ),
    );
  }
}

// create a message model
class Message {
  final String id; // Unique identifier for the message
  final String content;
  final String sender;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.content,
    required this.sender,
    required this.timestamp,
  });

  // Factory method to create a Message object from Firestore document data
  factory Message.fromFirestore(Map<String, dynamic> data) {
    return Message(
      id: data['id'],
      content: data['content'],
      sender: data['sender'],
      timestamp:
          data['timestamp'].toDate(), // Convert Firestore timestamp to DateTime
    );
  }

  // Method to convert a Message object to a map for Firestore storage
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'content': content,
      'sender': sender,
      'timestamp': Timestamp.fromDate(
          timestamp), // Convert DateTime to Firestore timestamp
    };
  }
}
/*

      */