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
      home: MainTabBarScreen(),
    );
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
          PetHome(),
          Profile(),
          FavoritesPage(),
        ],
      ),
        bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        labels: const ["Home", "Profile", "Favorites"],
        icons: const [Icons.home, Icons.person, Icons.favorite],
        tabSize: 60,
        textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        tabBarColor: Color(0xff9188e3),
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


/*

colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(
secondary: Colors.tealAccent,


 */

/*
import 'package:flutter/material.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Quiz 1"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hello " + (5 > 3 ? "World" : "Flutter"), style: TextStyle(fontSize: 24),),
              const SizedBox(height: 20),
              Container(width: 100, height: 50, color: Colors.blue,
                child:const Center(
                  child: Text((true && false ? "Yes" : "No"), style: TextStyle(color: Colors.white),),),),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon((2 + 2 == 5 ? Icons.check : Icons.close), color: Colors.red,),
                  Text((2 + 2 == 5 ? " Correct" : " Incorrect"), style: TextStyle(fontSize: 18),),
                ],),],),),),);}}
*/
