import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(FridgeApp());
}

class FridgeApp extends StatelessWidget {
  const FridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: FridgeScreen(),
    );
  }
}

class FridgeScreen extends StatefulWidget {
  const FridgeScreen({super.key});

  @override
  _FridgeScreenState createState() => _FridgeScreenState();
}

class _FridgeScreenState extends State<FridgeScreen> {
  Map<String, List<String>> categories = {
    "Meat": ["chicken thighs", "ground beef", "lunch meat", "sausages"],
    "Veggies": ["spinach", "cabbage", "lemons", "tomatoes", "avocado", "cauliflower"],
    "Dairy": ["butter", "cheese", "sour cream", "yogurt"],
    "Baking": ["flour", "choco chips", "cocoa powder", "dry yeast", "baking powder"],
    "Drinks": ["fresh juice", "almond milk", "soft drinks", "water"],
    "Freezer": ["ice cream", "meat", "chocolates"],
  };

  Map<String, bool> checkedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fridge", style: GoogleFonts.afacad(fontSize: 22, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
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
          children: categories.entries.map((entry) {
            return Card(
              color: Colors.purple.shade800,
              margin: EdgeInsets.symmetric(vertical: 6.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: GoogleFonts.afacad(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: entry.value.map((item) {
                          return CheckboxListTile(
                            title: Text(item, style: GoogleFonts.afacad(color: Colors.white)),
                            value: checkedItems[item] ?? false,
                            onChanged: (bool? value) {
                              setState(() {
                                checkedItems[item] = value ?? false;
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
