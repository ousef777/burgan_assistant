import 'package:flutter/material.dart';

BottomNavigationBar navbar() {
  return BottomNavigationBar(
      onTap: (value) {},
      unselectedItemColor: Colors.black,
      fixedColor: Colors.black,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance), label: "Balance"),
        BottomNavigationBarItem(icon: Icon(Icons.table_view), label: "Goals"),
        BottomNavigationBarItem(icon: Icon(Icons.table_view), label: "Loan"),
        BottomNavigationBarItem(
            icon: Icon(Icons.inventory_sharp), label: "Invest"),
      ]);
}
