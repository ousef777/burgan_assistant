import 'package:burgan_assistant/pages/Financing_page.dart';
import 'package:burgan_assistant/pages/Saving_page.dart';
import 'package:flutter/material.dart';

//import 'InvestmentPage.dart'; // Import InvestmentPage (create this if it doesn't exist)

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0; // Track the currently selected index

  // List of pages to navigate
  final List<Widget> _pages = [
    //HomePage(), // Replace with your HomePage widget
    SavingPage(),
    FinancingPage(),
    //InvestmentPage(), // Replace with your InvestmentPage widget
  ];

  // Method to update the selected index and navigate to the respective page
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.savings),
            label: 'Saving',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Financing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Investment',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onItemTapped, // Handle tap on bottom navigation bar items
      ),
    );
  }
}
