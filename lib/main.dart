import 'package:flutter/material.dart';
import 'pages/Saving_page.dart'; // Updated import statement
import 'pages/Financing_page.dart'; // Import FinancingPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saving Goals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        inputDecorationTheme:
            InputDecorationTheme(border: OutlineInputBorder()),
      ),

      home: FinancingPage(), // Set SavingPage as the home screen
      routes: {
        '/financing': (context) =>
            FinancingPage(), // Define the route for FinancingPage
      },
    );
  }
}
