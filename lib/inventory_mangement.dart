import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'package:myapp/pantry.dart';
import 'package:myapp/fridge.dart';
import 'package:myapp/stock_up.dart';
import 'package:myapp/home_page.dart'; // Import your HomePage
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
      title: 'Monthly Planner',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Color(0xFF3B1E54), // Set background to 3B1E54
        textTheme: GoogleFonts.afacadTextTheme(
          // Apply Afacad to entire app
          Theme.of(context).textTheme,
        ),
      ),
      home: MonthlyPlannerPage(),
    );
  }
}

class MonthlyPlannerPage extends StatefulWidget {
  @override
  _MonthlyPlannerPageState createState() => _MonthlyPlannerPageState();
}

class _MonthlyPlannerPageState extends State<MonthlyPlannerPage> {
  DateTime _currentDate = DateTime.now();
  DateTime? _selectedDate;

  String get _formattedMonthYear {
    return DateFormat('MMMM yyyy').format(_currentDate);
  }

  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
      _selectedDate = null;
    });
  }

  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
      _selectedDate = null;
    });
  }

  List<List<String>> _getCalendarDates() {
    final firstDayOfMonth = DateTime(_currentDate.year, _currentDate.month, 1);
    final weekdayOfFirstDay = firstDayOfMonth.weekday;
    final daysInMonth = DateTime(_currentDate.year, _currentDate.month + 1, 0).day;

    final List<List<String>> calendarDates = [];
    List<String> week = [];

    // Fill the first week with empty strings for days before the first of the month
    for (int i = 1; i < weekdayOfFirstDay; i++) {
      week.add('');
    }

    // Fill the calendar with the days of the month
    for (int day = 1; day <= daysInMonth; day++) {
      week.add(day.toString());
      if (week.length == 7) {
        calendarDates.add(week);
        week = [];
      }
    }

    // Fill the last week with empty strings if necessary
    while (week.length < 7 && week.isNotEmpty) {
      week.add('');
    }
    if (week.isNotEmpty) {
      calendarDates.add(week);
    }

    return calendarDates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100),
                _buildCalendarContainer(),
                SizedBox(height: 50),
                _buildPantryButtons(),
                SizedBox(height: 100),
              ],
            ),
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
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
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
          } else if (index != 0 && index != 2 && index != 4) {
          }
          // Handle other tab presses if needed
        },
      ),
    );
  }

  Widget _buildCalendarContainer() {
    return Column(
      children: [
        Text(
          'Monthly Planner',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 80),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF9B7EBD), // Calendar color unchanged
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 2), // Add black border
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: _previousMonth,
                  ),
                  Text(
                    _formattedMonthYear,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: _nextMonth,
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildCalendarGrid(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    const List<String> days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
    final List<List<String>> dates = _getCalendarDates();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: days
              .map((day) => Expanded(
                    child: Center(
                      child: Text(day, style: TextStyle(color: Colors.white)),
                    ),
                  ))
              .toList(),
        ),
        SizedBox(height: 8),
        ...dates.map((week) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: week.map((date) {
                if (date.isEmpty) {
                  return Expanded(child: Container(width: 30, height: 30));
                }
                final dayNum = int.tryParse(date);
                final currentDate = dayNum != null
                    ? DateTime(_currentDate.year, _currentDate.month, dayNum)
                    : null;

                final isSelected = _selectedDate != null &&
                    currentDate != null &&
                    _selectedDate!.year == currentDate.year &&
                    _selectedDate!.month == currentDate.month &&
                    _selectedDate!.day == currentDate.day;

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate = currentDate;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Colors.white : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          date,
                          style: TextStyle(
                            color: isSelected ? Colors.deepPurple : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            )),
      ],
    );
  }

  Widget _buildPantryButtons() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFD4BEE4), // Set background color to D4BEE4
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PantryPage()),
              );
            },
            child: Text('Pantry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, // Ensure no override
              foregroundColor: Colors.black, // Text color
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD4BEE4), // Set background color to D4BEE4
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FridgeScreen()),
                  );
                },
                child: Text('Fridge'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Ensure no override
                  foregroundColor: Colors.black, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD4BEE4), // Set background color to D4BEE4
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShoppingListPage()),
                  );
                },
                child: Text('Stock Up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Ensure no override
                  foregroundColor: Colors.black, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}