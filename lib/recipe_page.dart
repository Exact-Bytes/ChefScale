import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  TextEditingController _inputController = TextEditingController();
  String recipeResult = "Enter an ingredient or dish to get a recipe";

  Future<void> fetchRecipe(String query) async {
    const String apiKey = "AIzaSyDlFOo6r6EOy1aNNImlHQyLBZDKTZo93p4";
    const String apiUrl = "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateText?key=$apiKey";


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
            data['candidates'][0]['content']['parts'][0]['text']; // Corrected JSON path
      });
    } else {
      setState(() {
        recipeResult = "Failed to fetch recipe. Error: ${response.body}";
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
        backgroundColor: Color(0xFF3F2A52),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ""),
        ],
      ),
    );
  }
}
