import 'package:campus_market_place/pages/sign_up.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 250,),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
              ),
              children: [
                TextSpan(text: 'Start your journey with '),
                TextSpan(
                  text: 'j',
                  style: TextStyle(color: Colors.deepOrange),
                ),
                TextSpan(text: 'Shop'),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //register button
                GestureDetector(
                   onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => const SignUp())));
                      },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                      )),
                ),
                    //sign in button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginPage())));
                      },
                      child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        child: Text(
                          "Sign in",
                          style: TextStyle(color: Colors.deepOrange,fontSize: 20),
                        ),
                      )),
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
