import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Animal_Details_Page.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Favorites",style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff9188e3),
      ),
      body: FutureBuilder<User?>(

       /*
          Use .authStateChanges().first for a dynamic, reactive approach.
          Use .currentUser for a quick, static snapshot of the current state.
       */
        //It checks the current user's authentication state (like if they’re logged in or not) and gives you the first change it detects, then stops listening.
        // For below line please check https://firebase.google.com/docs/auth/flutter/start
        future: FirebaseAuth.instance.authStateChanges().first,
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!userSnapshot.hasData) {
            return const Center(child: Text("Please log in to view your favorites."));
          }

          final userId = userSnapshot.data!.uid;

          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('animals')
                .doc('Dog')
                .collection('animals')
                .where('favorites', arrayContains: userId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text("No favorites yet!"));
              }

              final favoriteAnimals = snapshot.data!.docs;

              return ListView.builder(
                itemCount: favoriteAnimals.length,
                itemBuilder: (context, index) {
                  final animal = favoriteAnimals[index];
                  final data = animal.data() as Map<String, dynamic>;

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data['imageUrl']),
                    ),
                    title: Text(data['name']),
                    subtitle: Text("${data['distance']} Km Away"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimalDetailsPage(animalData: data),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );

        },
      ),
    );
  }
}
