import 'package:flutter/material.dart';

class InvestPage extends StatelessWidget {
  final List<Map<String, dynamic>> myStocks = [
    {
      'company': 'Apple',
      'price': 'KD 175.50',
      'isUp': true,
      'imagePath': 'images/apple.jpeg',
    },
    {
      'company': 'McDonald\'s',
      'price': 'KD 95.30',
      'isUp': false,
      'imagePath': 'images/mcdon.jpeg',
    },
  ];

  final List<Map<String, dynamic>> popularStocks = [
    {
      'company': 'Amazon',
      'price': 'KD 215.75',
      'isUp': true,
      'imagePath': 'images/amazon.png',
    },
    {
      'company': 'Google',
      'price': 'KD 135.20',
      'isUp': false,
      'imagePath': 'images/google.png',
    },
    {
      'company': 'Facebook',
      'price': 'KD 85.50',
      'isUp': true,
      'imagePath': 'images/facebook.png',
    },
    {
      'company': 'Microsoft',
      'price': 'KD 120.00',
      'isUp': true,
      'imagePath': 'images/microsoft.png',
    },
    {
      'company': 'Tesla',
      'price': 'KD 160.00',
      'isUp': false,
      'imagePath': 'images/tesla.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Investment',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Stocks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: myStocks.map((stock) => buildStockCard(stock)).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Popular Stocks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children:
                  popularStocks.map((stock) => buildStockCard(stock)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStockCard(Map<String, dynamic> stock) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Circular image with larger size
          CircleAvatar(
            radius: 32, // Increased radius for larger image
            backgroundImage: AssetImage(stock['imagePath']),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stock['company'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  stock['price'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            stock['isUp'] ? Icons.arrow_upward : Icons.arrow_downward,
            color: stock['isUp'] ? Colors.green : Colors.red,
            size: 28,
          ),
        ],
      ),
    );
  }
}
