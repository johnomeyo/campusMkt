import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class User {
  final String email;
  final String fullName;
  final String location;

  User({required this.email, required this.fullName, required this.location});
}

class UserDataDisplay extends StatelessWidget {
  const UserDataDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      body: Builder(
        builder: (context) {
          if (user != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text('Email'),
                  subtitle: Text(user.email),
                ),
                ListTile(
                  title: const Text('Full Name'),
                  subtitle: Text(user.fullName ?? ''),
                ),
                ListTile(
                  title: const Text('Location'),
                  subtitle: Text(user.location ?? ''),
                ),
              ],
            );
          } else {
            // Show a loading indicator or error message when user data is not available
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


class UserProvider extends ChangeNotifier {
  User? user;

  Future<void> fetchUserData() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').doc('yubTpnA5Nce0uryNuW95').get();

      final userData = snapshot.data();
      user = User(
        email: userData!['email'],
        fullName: userData['fullName'],
        location: userData['location'],
      );

      notifyListeners();
    } catch (e) {
      // Handle any errors that occur during data retrieval
      print('Error fetching user data: $e');
    }
  }
}
