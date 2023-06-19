import 'package:campus_market_place/components/beta_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final locationController = TextEditingController();
  final fullnameController = TextEditingController();
  void signUp() async {
   try{ await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    await FirebaseFirestore.instance.collection("users").doc().set({
      "email": emailController.text,
      "full name": fullnameController.text,
      "location": locationController.text,
      "password": passwordController.text,
    });
    }
    catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Let's get Started!",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 70, fontWeight: FontWeight.w900)),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Please enter your information below to create an account for using in the app",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 20),
                  ),
                ),
                //school textfield

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: locationController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Where do you study?',
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),
                ),
                //full name textfield
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: fullnameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Full name',
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),
                ),
                //email textfield
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          suffixIcon: const Icon(Icons.check_circle_rounded)),
                    ),
                  ),
                ),
                //password textfield
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          suffixIcon: const Icon(Icons.visibility)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text("Register now",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const LoginPage())));
                        },
                        child: const Text("Log in",
                            style: TextStyle(
                                color: Colors.deepOrange, fontSize: 15)))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: Colors.grey.shade200,
                      )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Or sign up with"),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.grey.shade200,
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginOptionTile(imageUrl: "assets/google.png"),
                  SizedBox(width: 20,),
                  LoginOptionTile(imageUrl: "assets/apple.png",),
                ],
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
