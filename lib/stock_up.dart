import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/home_page.dart';
import 'package:myapp/camera_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF442A65), // Changed background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Stock up',
            style: GoogleFonts.afacad(color: Colors.white, fontSize: 30), // Applied Afacad font
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // Handle profile
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: _buildCategory(shoppingList.keys.toList()[0], shoppingList.values.toList()[0]),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: _buildCategory(shoppingList.keys.toList()[1], shoppingList.values.toList()[1]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: _buildCategory(shoppingList.keys.toList()[2], shoppingList.values.toList()[2]),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: _buildCategory(shoppingList.keys.toList()[3], shoppingList.values.toList()[3]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: _buildCategory(shoppingList.keys.toList()[4], shoppingList.values.toList()[4]),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: _buildCategory(shoppingList.keys.toList()[5], shoppingList.values.toList()[5]),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          if(index==0){
             Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          }
          if (index == 2) {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CameraPage(),
              ),
            );
          }

          if (index == 4) {
           
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const ProfilePage(),
            //   ),
            // );
          }
          // Handle other tab presses if needed
        },
      ),
    );
  }

  Widget _buildCategory(String title, List<ShoppingItem> items) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.afacad(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 150, // Fixed height for scrolling content
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Checkbox(
                          value: item.checked,
                          onChanged: (bool? value) {
                            setState(() {
                              item.checked = value!;
                            });
                          },
                          checkColor: Colors.white,
                          activeColor: Color(0xFF673AB7),
                          side: BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item.name,
                            style: GoogleFonts.afacad(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShoppingItem {
  String name;
  bool checked;

  ShoppingItem({required this.name, required this.checked});
}