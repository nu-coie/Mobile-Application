import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String name ='';
  String email = '';
  String password = '';


  bool showSpiner = false;
  // Reusable InputDecoration method
  InputDecoration _buildInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.black26),
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(height: 48.0),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value)
                {
                  email = value;
                },
                decoration: _buildInputDecoration('Enter your email'),
              ),
              const SizedBox(height: 8.0),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value)
                {
                  name = value;
                },
                decoration: _buildInputDecoration('Enter your name'),
              ),
              const SizedBox(height: 8.0),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value)
                {
                  password = value;
                },
                decoration: _buildInputDecoration('Enter your password'),
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
                  onPressed: () async
                  {
                    if(email.isEmpty || password.isEmpty)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Enter Email and Password")));
                      return;
                    }
                    setState(() {showSpiner = true;});
                    try {
                      final addUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if (addUser != null) {
                        final uid = addUser.user?.uid;
                        if (uid != null) {
                          await FirebaseFirestore.instance.collection('ProfileInfo').doc(uid).set({
                            'UserName': name,
                            'job': 'No Job',
                            'PhoneNumber': 'No Phone',
                            'ProfileImageURL': '',
                          });
                        }
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()));
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error. Please try again.")));
                    } finally {setState(() {showSpiner = false;});}


                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

