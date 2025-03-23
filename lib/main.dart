import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'home_page.dart';
import 'create_account.dart';

void main() {
  runApp(const ChefScaleApp());
}

class ChefScaleApp extends StatelessWidget {
  const ChefScaleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/home': (context) => const HomePage(), // HomePage Route
        '/create_account':
            (context) =>
                const CreateAccountPage(), // Define your CreateAccountPage
      },
    );
  }
}
