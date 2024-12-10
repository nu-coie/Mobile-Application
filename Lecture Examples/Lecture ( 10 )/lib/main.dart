import 'package:flutter/material.dart';
import 'package:profile_app/Quote/quote_home_screen.dart';
//import 'package:profile_app/home_page.dart';
import 'package:profile_app/pet/Favorites_Page.dart';
import 'package:profile_app/pet/Home_Page.dart';
import 'package:profile_app/profile_page.dart';
import 'welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,
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
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}
