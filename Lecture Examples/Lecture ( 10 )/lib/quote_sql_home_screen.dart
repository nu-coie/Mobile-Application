import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:profile_app/constant.dart';

import 'quote_details_screen.dart';

class HomeScreensql extends StatefulWidget {
  @override
  _HomeScreensqlState createState() => _HomeScreensqlState();
}

class _HomeScreensqlState extends State<HomeScreensql> {
  String searchText = "";
  final TextEditingController _searchController = TextEditingController();

  List<dynamic> quotes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

  Future<void> fetchQuotes() async {
    try {
      final response = await http.get(Uri.parse("PUT Your path here "));
      if (response.statusCode == 200) {
         final decodedData = json.decode(response.body) as Map<String, dynamic>;
        setState(() {
          quotes = decodedData.values.toList();
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load quotes");
      }
    } catch (e) {
      setState(()
      {
        isLoading = false;
      });
      print("Error fetching quotes: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // Search Box
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                labelText: "Search quotes",
                hintText: "Enter a keyword",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // Quotes List
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : quotes.isEmpty
                ? const Center(child: Text("No quotes found"))
                : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                final quote = quotes[index];
                final text = (quote['text'] ?? "").toLowerCase();
                final author = (quote['author'] ?? "").toLowerCase();

                if (text.contains(searchText) || author.contains(searchText)) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuoteDetailsScreen(
                            text: quote['text'] ?? "No text",
                            imageUrl: quote['bg'] ?? "",
                            author: quote['author'] ?? "Unknown",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
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

                              (quote['image_url'] != null && quote['image_url'].isNotEmpty)
                                  ? Image.network(
                                quote['image_url'],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset('images/ss.png', fit: BoxFit.cover),
                              )
                                  : Image.asset('images/ss.png', fit: BoxFit.cover),
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
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
