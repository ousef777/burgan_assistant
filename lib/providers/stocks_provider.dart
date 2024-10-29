import 'package:flutter/material.dart';

class StocksProvider extends ChangeNotifier {
  List<Map<String, dynamic>> myStocks = [
    {
      'company': 'Apple',
      'price': 175.50,
      'isUp': true,
      'imagePath': 'assets/images/apple.jpeg',
      'description':
          'Apple Inc. designs, manufactures, and markets consumer electronics, computer software, and online services.',
    },
    {
      'company': 'McDonald\'s',
      'price': 95.30,
      'isUp': false,
      'imagePath': 'assets/images/mcdon.jpeg',
      'description':
          'McDonald\'s Corporation is an American fast-food company, serving more than 69 million customers daily in over 100 countries.',
    },
  ];

  void addStock(Map<String, dynamic> stock, double totalprice) {
    stock['price'] = totalprice;
    myStocks.add(stock);
    notifyListeners();
  }
}
