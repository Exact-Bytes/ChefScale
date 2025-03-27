import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/fridge.dart';
import 'package:myapp/home_page.dart';
import 'package:myapp/stock_up.dart';
// Uncomment these imports when you want to use them
// import 'package:myapp/camera_page.dart'; // Import your CameraPage
// import 'package:myapp/profile_page.dart'; // Import your ProfilePage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PantryPage(),
    );
  }
}

class PantryPage extends StatefulWidget {
  @override
  _PantryPageState createState() => _PantryPageState();
}

class _PantryPageState extends State<PantryPage> {
  Map<String, bool> itemChecked = {};
  int _currentIndex = 0;

  void _navigateToPage(int index, BuildContext context) {
    if (index == 0) {
      // Navigate to Fridge page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FridgeScreen()), // Navigate to FridgeScreen
      );
    } else {
      // Navigate to Stock Up page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShoppingListPage()), // Navigate to ShoppingListPage
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF442A65),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Pantry',
          style: GoogleFonts.afacad(color: Colors.white, fontSize: 30),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {},
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTab('Fridge', 0, context),
                  SizedBox(width: 2),
                  _buildTab('Stock Up', 1, context),
                ],
              ),
              SizedBox(height: 20),
              _buildPantryCategories(),
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
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Navigate to HomePage
            );
          }
          if (index == 2) {
            // Uncomment this when you want to use the CameraPage
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const CameraPage(),
            //   ),
            // );
          }

          if (index == 4) {
            // Uncomment this when you want to use the ProfilePage
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

  Widget _buildTab(String title, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToPage(index, context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xFFD4BEE4),
          border: Border.all(color: Colors.transparent),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.afacad(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPantryCategories() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: _buildCategory('Beans',
                    ['green beans', 'chickpeas', 'black beans', 'lentils']),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: _buildCategory('Spices', [
                  'kosher salt',
                  'black pepper',
                  'garlic powder',
                  'cumin',
                  'oregano',
                  'paprika'
                ]),
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
                child: _buildCategory('Bottled',
                    ['honey', 'olive oil', 'soy sauce', 'vinegar']),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: _buildCategory('Carbs',
                    ['pasta', 'spaghetti', 'boxed cheese', 'chia seeds', 'flax seed']),
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
                child: _buildCategory('Jar',
                    ['peanut butter', 'olives', 'pickles', 'mayonnaise']),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: _buildCategory('Produce', ['onions', 'garlic', 'potatoes']),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategory(String title, List<String> items) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF9B7EBD),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
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
                  if (itemChecked[item] == null) {
                    itemChecked[item] = false;
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Checkbox(
                          value: itemChecked[item],
                          onChanged: (bool? value) {
                            setState(() {
                              itemChecked[item] = value!;
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
                            item,
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