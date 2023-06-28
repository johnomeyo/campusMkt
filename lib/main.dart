import 'package:campus_market_place/providers.dart/alpha.dart';
import 'package:campus_market_place/services/auth_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


Future <void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyBrIJtEZ2ODCsEDLWgS98E-G7jgFxKXmUA", appId: "com.example.campus_market_place", messagingSenderId: "455772269441-0ip872orhvb8lnfb4gdsmnk0g19suiho.apps.googleusercontent.com", projectId: "localsell-d4193")
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(providers: [
      //  ChangeNotifierProvider(create: (context) => UserProvider()),
       ChangeNotifierProvider(create: (context) => FavIcon()),
      ],
      child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthPage(),
    );
  }
}
