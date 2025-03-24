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
      home: RecipeFilterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RecipeFilterScreen extends StatefulWidget {
  const RecipeFilterScreen({super.key});

  @override
  _RecipeFilterScreenState createState() => _RecipeFilterScreenState();
}

class _RecipeFilterScreenState extends State<RecipeFilterScreen> {
  String? _clickedChipLabel;
  final Color backgroundColor = Color(0xFF30134B); // Dark purple background
  final Color chipColor = Color(0xFF9E7BB5); // Mauve chip color
  final Color textColor = Colors.white;
  final Color borderColor = Color(0xFFD3B8E0); // Light purple border

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: textColor),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: textColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              SizedBox(height: 20),
              _buildCategory("Popular", [
                'Quick Recipes',
                'Family Favorites',
                'Healthy Options',
                'Budget-Friendly',
                'Gourmet Treats',
                'Easy dinner',
              ]),
              _buildCategory("Occasion", [
                'Festive Feasts',
                'Casual Meals',
                'Weekend Specials',
                'Picnic Special',
                'Romantic Dinners',
                'Thanksgiving',
              ]),
              _buildCategory("Meal type", [
                'Breakfast Bliss',
                'Light Lunches',
                'Comfort Dinners',
                'On-the-Go Snacks',
                'Sweet Tooth',
              ]),
              _buildCategory("Diet", [
                'Low Carb',
                'Gluten-free',
                'Plant-Based',
                'Keto-Friendly',
                'High Protein',
              ]),
              _buildCategory("Ingredients", [
                '5 ingredients or less',
                'Fresh Produce',
                'Pantry Staples',
                'Exotic Flavors',
                'Spices & Herbs',
              ]),
              _buildCategory("Cooking styles", [
                'One-pot meals',
                'Grill & BBQ',
                'No-cook recipe',
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xFF442A65), // Darker purple for the search bar
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        style: GoogleFonts.afacad(color: textColor),
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: textColor),
          hintText: 'Search your recipes',
          hintStyle: GoogleFonts.afacad(color: textColor.withOpacity(0.7)),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildCategory(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(title, style: GoogleFonts.afacad(color: textColor, fontSize: 20)),
        SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: items.map((label) => _buildFilterChip(label)).toList(),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _clickedChipLabel = label;
        });
        Future.delayed(Duration(milliseconds: 200), () {
          setState(() {
            _clickedChipLabel = null;
          });
        });
      },
      child: AnimatedScale(
        scale: _clickedChipLabel == label ? 0.9 : 1.0, // Shrinks when tapped
        duration: Duration(milliseconds: 200),
        child: Chip(
          label: Text(
            label,
            style: GoogleFonts.afacad(color: textColor, fontSize: 16),
          ),
          backgroundColor: chipColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(17.0),
          ),
        ),
      ),
    );
  }
}
