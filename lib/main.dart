import 'package:flutter/material.dart';
import 'welcome_page.dart';
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
      title: 'Chef Scale',
      home: const WelcomePage(), // Starts with Welcome Page
      routes: {
        '/create_account': (context) => const CreateAccountPage(), // Route for Create Account Page
      },
    );
  }
}
