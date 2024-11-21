import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'profile_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool showSpiner = false;

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
            children: [
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(height: 48.0),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                onChanged: (value) => email = value,
                decoration: buildInputDecoration('Enter your email'),
              ),
              const SizedBox(height: 8.0),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                style: const TextStyle(color: Colors.black),
                onChanged: (value) => password = value,
                decoration: buildInputDecoration('Enter your password'),
              ),
              const SizedBox(height: 24.0),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
                      onPressed: () async {

                        if(email.isEmpty || password.isEmpty)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter Email and Password")));
                          return;
                        }

                        setState(() {
                          showSpiner = true;
                        });
                        try {
                          final loginuser =
                          await _auth.signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                        } finally {
                          setState(() {
                            showSpiner = false;
                          });
                        }
                      },
                      child: const Text('Log In'))),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black),
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
    );
  }
}
