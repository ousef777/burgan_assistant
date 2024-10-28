import 'package:burgan_assistant/pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:burgan_assistant/pages/Saving_page.dart';
import 'package:burgan_assistant/pages/Financing_page.dart';
import 'package:burgan_assistant/pages/Investmentpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
