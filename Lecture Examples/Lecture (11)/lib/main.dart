import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'pet/Home_Page.dart';
import 'profile_page.dart';
import 'pet/Favorites_Page.dart';
import 'welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: AuthChecker(),  
    );
  }
}

class AuthChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    
    if (user != null) {
      return MainTabBarScreen();  
    } else {
      return WelcomeScreen();  
    }
  }
}

class MainTabBarScreen extends StatefulWidget {
  @override
  _MainTabBarScreenState createState() => _MainTabBarScreenState();
}

class _MainTabBarScreenState extends State<MainTabBarScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          PetHome(),  // Main content for the first tab
          Profile(),  // Profile tab
          FavoritesPage(), // Favorites tab
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        labels: const ["Home", "Profile", "Favorites"],
        icons: const [Icons.home, Icons.person, Icons.favorite],
        tabSize: 60,
        textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        tabBarColor: const Color(0xff9188e3),
        onTabItemSelected: (int index) {
          setState(() {
            _tabController.index = index;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
