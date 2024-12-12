import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profile_app/pet/Explore_Page.dart';
import '../constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Animal_Details_Page.dart';
import 'Add_New_Animal.dart';
import 'package:profile_app/UserService.dart';

final TextEditingController _searchController = TextEditingController();
final UserService _userService = UserService();
String displayName = "Guest";
String imageUrl = "";
String searchText = "";
String selectedAnimal = "Dog";
class PetHome extends StatefulWidget {
  const PetHome({super.key});
  @override
  State<PetHome> createState() => _PetHomeState();
}

class _PetHomeState extends State<PetHome> {

  @override
  void initState()
  {
    super.initState();
    fetchUserDisplayName();
  }

  Future<void> fetchUserDisplayName() async {
    try {
      final user = await _userService.getCurrentUser();

      if (user != null) {
        final userInfo = await _userService.getUserInfo(user.uid);
        final image = await _userService.getUserImageUrl(user.uid);

        setState(() {
          displayName = userInfo['UserName'] ?? user.email ?? 'User';
          imageUrl = image;
        });
      }
    } catch (e) {
      print('Error fetching user display name: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: ListView(
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAnimalPage()));
                      }, child:
                      Icon(
                        FontAwesomeIcons.plus,
                        size: 25,
                      ),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const Text
                         (
                            "Hello,",
                            style: khello,
                         ),
                          Text
                          (
                            "$displayName 👋 ",
                            style: kname,
                          )
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: imageUrl.isNotEmpty ? NetworkImage(imageUrl) : const AssetImage('images/logo.png') as ImageProvider,
                  )
                ],
              ),
            ),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value)
                {
                  setState(()
                  {
                    searchText = value.toLowerCase();
                  });
                },
                decoration: kSearch,
              ),
            ),
            // Slider Section
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Image.asset('images/slider.png'),
                ),
                Positioned(
                  top: 160,
                  left: 75,
                  child: ElevatedButton(
                      style:kDonate,
                      onPressed: () {},
                      child: Text("Donate Now")),
                )
              ],
            ),
            // Categories Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Categories", style: kCate ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ExplorePage()));
                  }, child: Text("Explore",style: kExpl),)
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cats Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnimal = "Cat";
                        });
                      },
                      child: AnimalItem(name: "Cat", image: "images/5.png", isSelected: selectedAnimal == "Cat",),
                    ),
                    SizedBox(width: 18),
                    // Dogs Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnimal = "Dog";
                        });
                      },
                      child: AnimalItem(name: "Dog", image: "images/1.png", isSelected: selectedAnimal == "Dog",),
                    ),
                    SizedBox(width: 18),
                    // Fish Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnimal = "Fish";
                        });
                      },
                      child: AnimalItem(name: "Fish", image: "images/2.png", isSelected: selectedAnimal == "Fish",),
                    ),
                    SizedBox(width: 18),

                    // Birds Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnimal = "Bird";
                        });
                      },
                      child: AnimalItem(name: "Bird",image: "images/3.png",isSelected: selectedAnimal == "Bird",),
                    ),

                    SizedBox(width: 18),
                  ],
                ),
              ),
            ),
            // Animals List
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: StreamBuilder<QuerySnapshot>(

                stream: FirebaseFirestore.instance
                    .collection('animals')
                    .doc(selectedAnimal)
                    .collection('animals')
                    .snapshots(),























                builder: (context, snapshot)
                {
                  if (snapshot.connectionState == ConnectionState.waiting)
                  {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty)
                  {
                    return Center(child: Text("No $selectedAnimal Available"));
                  }

                  final allAnimals = snapshot.data?.docs??[];


                    final filteredAnimals = allAnimals.where((animal) {
                    final name = animal['name']?.toString().toLowerCase()??"";
                    return name.contains(searchText);
                  }).toList();


                  if (filteredAnimals.isEmpty)
                  {
                    return Center(child: Text("No matches found."));
                  }




















                  return SizedBox(
                    height: 290,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredAnimals.length,
                      itemBuilder: (context, index) {
                        final animal = filteredAnimals[index];



                        final name = animal['name'];
                        final distance = animal['distance'];
                        final imageUrl = animal['imageUrl'];

                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push( context,  MaterialPageRoute( builder: (context) => AnimalDetailsPage( animalData: animal.data() as Map<String, dynamic>,),
                                ),
                              );
                            },
                            child: Container(
                              width: 230,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                          imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0,),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                                      child: Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children: [
                                              Text(name,style: khomee),
                                              SizedBox(height: 4),
                                              Text("${distance.toStringAsFixed(1)} Km Away",style:kho),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push( context,  MaterialPageRoute( builder: (context) => AddAnimalPage(), ), );
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: GestureDetector(

                                                  onTap: () async {
                                                    final user = FirebaseAuth.instance.currentUser;
                                                    if (user == null) {
                                                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Please log in to favorite items')), );
                                                      return;
                                                    }

                                                    final userId = user.uid;

                                                     final animalRef = FirebaseFirestore.instance
                                                        .collection('animals')
                                                        .doc(selectedAnimal)
                                                        .collection('animals')
                                                        .doc(animal.id);

                                                    final currentData = await animalRef.get();
                                                    final favoritesList = (currentData['favorites'] as List<dynamic>?) ?? [];


                                                    final isCurrentlyFavorite = favoritesList.contains(userId);


                                                    if (isCurrentlyFavorite) {await animalRef.update({'favorites': FieldValue.arrayRemove([userId])});
                                                    } else {
                                                      await animalRef.update({'favorites': FieldValue.arrayUnion([userId])});
                                                    }

                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(content: Text(isCurrentlyFavorite? 'Removed from favorites': 'Added to favorites'),),);
                                                  },



                                                  child: Icon(Icons.favorite,color: ((animal['favorites'] as List<dynamic>?)?.contains(FirebaseAuth.instance.currentUser?.uid) ?? false)
                                                      ? Colors.red
                                                      : Colors.grey
                                                    ,size: 20,),
                                                ),
                                              ),

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 9)
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimalItem extends StatelessWidget {
  final String name;
  final String image;
  final bool isSelected;

  const AnimalItem({
    required this.name,
    required this.image,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xff9188e3) : Colors.white,

        borderRadius: BorderRadius.circular(15),

        border: Border.all(color: isSelected ? Color(0xff9188e3) : Colors.grey.shade300,),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(image,height: 40,width: 40,),

          SizedBox(width: 13),

          Text( name,style: TextStyle(color: isSelected ? Colors.white : Colors.grey[800],fontWeight: FontWeight.bold,),),
        ],
      ),
    );
  }
}
