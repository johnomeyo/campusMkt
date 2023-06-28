import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfoPagae extends StatelessWidget {
  const UserInfoPagae({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200),
                          child: Column(
                            children: [
                              Text(snapshot.data!.docs[index]['full name']),
                              Text(snapshot.data!.docs[index]['email']),
                              Text(snapshot.data!.docs[index]['location']),
                              Text(snapshot.data!.docs[index]['password']),
                            ],
                          )),
                    );
                  });
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
