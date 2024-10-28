import 'package:flutter/material.dart';
import 'pages/Saving_page.dart'; // Updated import statement

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
      ),
      home: SavingPage(), // Set SavingPage as the home screen
    );
  }
}
