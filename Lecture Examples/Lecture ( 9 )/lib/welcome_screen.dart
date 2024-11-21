import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_page.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState()
  {
    super.initState();
   //checkUserSignIn();
  }

  void checkUserSignIn() async
  {
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),

                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontFamily: 'Agne',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts:
                    [
                      TypewriterAnimatedText('Welcome to Profile', speed: Duration(milliseconds: 200),),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom( backgroundColor: Colors.blueAccent),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
              },
                child:  const Text('Log In',style: TextStyle(color: Colors.white),),)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child:ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                onPressed: ()
                  {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()),);
                  },
                child: const Text('Register',style: TextStyle(color: Colors.white),),)
            ),
          ],
        ),
      ),
    );
  }
}
















/*
 void checkUserSignIn() async
  {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null)
    {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()),);
      });
    }
  }
 */