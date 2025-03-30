import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myapp/camera_page.dart';
import 'package:myapp/profile_page.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  TextEditingController _inputController = TextEditingController();
  String recipeResult = "Enter an ingredient or dish to get a recipe";

  Future<void> fetchRecipe(String query) async {
    const String apiKey =
        "AIzaSyDlFOo6r6EOy1aNNImlHQyLBZDKTZo93p4"; // Replace with a secure method to store your API key
    const String apiUrl =
        "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateText?key=$apiKey";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "prompt": {
            "text":
                "Suggest a recipe based on this user input: $query. Provide ingredients and step-by-step instructions.",
          },
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          recipeResult =
              data['candidates'][0]['content']['parts'][0]['text'] ??
              "No recipe found."; // Ensure safe access
        });
      } else {
        setState(() {
          recipeResult = "Failed to fetch recipe. Please try again.";
        });
      }
    } catch (e) {
      setState(() {
        recipeResult =
            "An error occurred: $e"; // More user-friendly error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3F2A52),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF9678B6),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(
                  recipeResult,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => fetchRecipe("Quick and easy dinner"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7D5BA6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: Text(
                "Suggest Some Recipe...",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => fetchRecipe("Weekly meal plan"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7D5BA6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: Text(
                "Plan for a week...",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Ask me something...",
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => fetchRecipe(_inputController.text),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFD4BEE4),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black87,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Recipes",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: "Scan"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CameraPage()),
            );
          }

          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          } else if (index != 2 && index != 4) {
            // Handle other tab presses if needed.
          }
        },
      ),
    );
  }
}
