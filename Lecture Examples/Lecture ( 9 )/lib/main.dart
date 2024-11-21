import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProfileApp());
}








class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: ThemeMode.light,
      home: WelcomeScreen(),
    );
  }
}














/*

colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(
secondary: Colors.tealAccent,


 */