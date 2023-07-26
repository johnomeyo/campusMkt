// import 'package:flutter/material.dart';

// class ChatTrial extends StatefulWidget {
//   const ChatTrial({super.key});

//   @override
//   State<ChatTrial> createState() => _ChatTrialState();
// }

// class _ChatTrialState extends State<ChatTrial> {
//   final messageController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//           itemCount: 5,
//           itemBuilder: (context, index) => const ListTile(
//                 title: Text("hey"),
//               )),
//       bottomNavigationBar: Row(
//         children: [
//           SizedBox(
//             width: 300,
//             child: TextField(
//               controller: messageController,
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           CircleAvatar(
//             radius: 21,
//             backgroundColor: Colors.black,
//             child: CircleAvatar(
//                 radius: 20,
//                 backgroundColor: Colors.white,
//                 child: GestureDetector(
//                     onTap: () {},
//                     child: const Icon(
//                       Icons.arrow_upward_sharp,
//                       color: Colors.black,
//                     ))),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  final String currentUserUid; // The current user's unique identifier

  ChatScreen({required this.currentUserUid});

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    final currentTime = DateTime.now();

    await FirebaseFirestore.instance.collection('messages').add({
      'senderId': currentUserUid,
      'message': message,
      'timestamp': currentTime,
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('messages').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                final messages = snapshot.data!.docs;
                List<Widget> messageWidgets = [];

                for (var message in messages) {
                  final messageText =
                      message['message'] ?? 'No message available';
                  final messageSender = message['senderId'] ?? 'Unknown';

                  final messageWidget = Text('$messageSender: $messageText');
                  messageWidgets.add(messageWidget);
                }

                return ListView(
                  children: messageWidgets,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    onChanged: (value) {
                      // Handle text input
                    },
                    decoration: InputDecoration(hintText: 'Type a message...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
