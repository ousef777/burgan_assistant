import 'package:burgan_assistant/pages/Balance_page.dart';
import 'package:flutter/material.dart';
import 'package:burgan_assistant/pages/Saving_page.dart';
import 'package:burgan_assistant/pages/Financing_page.dart';
import 'package:burgan_assistant/pages/investment_page.dart'; // Import the InvestPage

class MainPage extends StatefulWidget {
  final int index;
  const MainPage({super.key, required this.index});

  @override
  _MainPageState createState() => _MainPageState(index);
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0; // Default to SavingPage
  _MainPageState(this._selectedIndex);
  // List of pages to navigate
  final List<Widget> _pages = [
    BalancePage(),
    SavingPage(),
    FinancingPage(),
    InvestPage(), // Include InvestPage here
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
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Balance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Saving',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Financing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Investment',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Home',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black, // Set color of selected item
        unselectedItemColor: Colors.black, // Set color of unselected items
        onTap: _onItemTapped, // Call the method to handle taps
      ),
    );
  }
}
