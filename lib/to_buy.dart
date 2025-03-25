import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingListPage(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  // Data for the shopping list
  Map<String, List<ShoppingItem>> shoppingList = {
    'Meat': [
      ShoppingItem(name: 'chicken thighs', checked: true),
      ShoppingItem(name: 'eggs', checked: false),
      ShoppingItem(name: 'lunch meat', checked: true),
      ShoppingItem(name: 'shrimps', checked: false),
    ],
    'Veggies': [
      ShoppingItem(name: 'spinach', checked: true),
      ShoppingItem(name: 'pumpkin', checked: false),
      ShoppingItem(name: 'corn', checked: false),
      ShoppingItem(name: 'broccoli', checked: false),
      ShoppingItem(name: 'lemons', checked: true),
    ],
    'Spices': [
      ShoppingItem(name: 'turmeric', checked: false),
      ShoppingItem(name: 'bay leaf', checked: false),
      ShoppingItem(name: 'cloves', checked: false),
      ShoppingItem(name: 'cinnamon', checked: false),
    ],
    'Fruits': [
      ShoppingItem(name: 'apple', checked: false),
      ShoppingItem(name: 'watermelon', checked: true),
      ShoppingItem(name: 'pineapple', checked: false),
      ShoppingItem(name: 'kiwi', checked: false),
      ShoppingItem(name: 'guava', checked: true),
    ],
    'Main': [
      ShoppingItem(name: 'rice', checked: false),
      ShoppingItem(name: 'bread', checked: false),
    ],
    'Dairy': [
      ShoppingItem(name: 'ice cream', checked: true),
      ShoppingItem(name: 'salted butter', checked: false),
      ShoppingItem(name: 'buttermilk', checked: false),
    ],
  };

  Map<String, bool> checkedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3B1E54), // Set background color
      appBar: AppBar(
        title: Text(
          'To Buy',
          style: GoogleFonts.afacad(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center, // Center the title
        ),
        centerTitle: true, // Centers the title in the AppBar
        backgroundColor: Color(0xFF3B1E54), // White appbar background
        iconTheme: IconThemeData(color: Colors.white), // White icons in appbar
        actions: [
          // Removed the search icon
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            // White notifications icon
            onPressed: () {
              // Handle notifications action
            },
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.white),
            // White profile icon
            onPressed: () {
              // Handle profile action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.2,
          children: shoppingList.entries.map((entry) {
            return Card(
              color: Color(0xFF9B7EBD), // Category box color
              margin: EdgeInsets.symmetric(vertical: 6.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: GoogleFonts.afacad(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: entry.value.map((item) {
                          return CheckboxListTile(
                            title: Text(item.name,
                                style: GoogleFonts.afacad(color: Colors.white)),
                            value: item.checked,
                            onChanged: (bool? value) {
                              setState(() {
                                item.checked = value ?? false;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.white,
                            checkColor: Colors.purple,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ShoppingItem {
  String name;
  bool checked;

  ShoppingItem({required this.name, required this.checked});
}