import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profile_app/constant.dart';
import 'quote_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = "";
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
        centerTitle: true,
        backgroundColor: Colors.teal[50],
      ),
      body: Column(
        children: [
          // Search Box
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(

              controller: _searchController,
              onChanged: (value)
              {
                setState(() {
                  searchText = value.toLowerCase(); // Update the search text
                });
              },
              decoration: InputDecoration(
                labelText: "Search quotes",
                hintText: "Enter a keyword",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // Quotes List
          Expanded(
            child: StreamBuilder<QuerySnapshot>
          (stream: _firestore.collection('quotes').snapshots(),



    builder: (context,snapshot)
    {

      if(snapshot.connectionState == ConnectionState.waiting)
        {
          return Center(child: CircularProgressIndicator(),);
        }


      if(snapshot.hasError)
        {
      return    Center(child: Text("Erroe fetch data"),);
        }

      final quotes = snapshot.data?.docs??[];

      final filteredQuotes = quotes.where(

          (doc)
              {
                final data = doc.data() as Map<String,dynamic>;

                final text = data['text']?.toLowerCase() ??"";

                final author =  data['author']?.toLowerCase() ??"";

             return text.contains(searchText)|| author.contains(searchText);

              }

      ).toList();
      if(filteredQuotes.isEmpty)
  {
            return Center(child: Text("No quotes found"),);
  }



























                return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: filteredQuotes.length,
                  itemBuilder: (context, index) {
                    final quote = filteredQuotes[index].data() as Map<String, dynamic>;

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuoteDetailsScreen(
                              text: quote['text'],
                              imageUrl: quote['bg'],
                              author: quote['author'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: 200,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                (quote['image_url'] != null)?  Image.network(quote['image_url'],fit: BoxFit.cover,) : Image.asset('images/ss.png'),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.6),
                                        Colors.black.withOpacity(0.3),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 20,
                                  right: 20,
                                  child: Text(
                                    quote['text'] ?? "No text",
                                    style: kStyle,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
