import 'package:flutter/material.dart';

class InvestPage extends StatelessWidget {
  final List<Map<String, dynamic>> myStocks = [
    {
      'company': 'Apple',
      'price': 175.50,
      'isUp': true,
      'imagePath': 'images/apple.jpeg',
      'description':
          'Apple Inc. designs, manufactures, and markets consumer electronics, computer software, and online services.',
    },
    {
      'company': 'McDonald\'s',
      'price': 95.30,
      'isUp': false,
      'imagePath': 'images/mcdon.jpeg',
      'description':
          'McDonald\'s Corporation is an American fast-food company, serving more than 69 million customers daily in over 100 countries.',
    },
  ];

  final List<Map<String, dynamic>> popularStocks = [
    {
      'company': 'Amazon',
      'price': 215.75,
      'isUp': true,
      'imagePath': 'images/amazon.png',
      'description':
          'Amazon.com, Inc. is an American multinational technology company focusing on e-commerce, cloud computing, and artificial intelligence.',
    },
    {
      'company': 'Google',
      'price': 135.20,
      'isUp': false,
      'imagePath': 'images/google.png',
      'description':
          'Google LLC is a multinational technology company specializing in Internet-related services and products.',
    },
    {
      'company': 'Facebook',
      'price': 85.50,
      'isUp': true,
      'imagePath': 'images/facebook.png',
      'description':
          'Meta Platforms, Inc., formerly known as Facebook, Inc., is an American multinational technology conglomerate.',
    },
    {
      'company': 'Microsoft',
      'price': 120.00,
      'isUp': true,
      'imagePath': 'images/microsoft.png',
      'description':
          'Microsoft Corporation is an American multinational technology company that develops, manufactures, licenses, supports, and sells computer software, electronics, and personal computers.',
    },
    {
      'company': 'Tesla',
      'price': 160.00,
      'isUp': false,
      'imagePath': 'images/tesla.png',
      'description':
          'Tesla, Inc. is an American electric vehicle and clean energy company.',
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
              children: myStocks
                  .map((stock) => buildStockCard(stock, context))
                  .toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Popular Stocks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: popularStocks
                  .map((stock) => buildStockCard(stock, context))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStockCard(Map<String, dynamic> stock, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StockDetailPage(stock: stock),
          ),
        );
      },
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
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
                        'KD ${stock['price']}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
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
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class StockDetailPage extends StatefulWidget {
  final Map<String, dynamic> stock;

  StockDetailPage({required this.stock});

  @override
  _StockDetailPageState createState() => _StockDetailPageState();
}

class _StockDetailPageState extends State<StockDetailPage> {
  int quantity = 1;

  final List<Map<String, dynamic>> stockHistory = [
    {'date': '2024-10-25', 'price': 170.00, 'isUp': true},
    {'date': '2024-10-20', 'price': 168.00, 'isUp': true},
    {'date': '2024-10-15', 'price': 165.00, 'isUp': false},
    {'date': '2024-10-10', 'price': 170.00, 'isUp': false},
    {'date': '2024-10-05', 'price': 172.00, 'isUp': true},
    {'date': '2024-10-01', 'price': 169.00, 'isUp': false},
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = quantity * (widget.stock['price'] as double);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.stock['company']),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(widget.stock['imagePath']),
            ),
            SizedBox(height: 16),
            Text(
              widget.stock['company'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.stock['description'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Moved Price section down and made it bold
            Text(
              'Price: KD ${widget.stock['price']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16), // Increased space
            Center(
              child: Column(
                children: [
                  // Only show quantity and total for stocks other than Apple and McDonald's
                  if (widget.stock['company'] != 'Apple' &&
                      widget.stock['company'] != 'McDonald\'s')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Quantity: ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                        ),
                        Text(
                          '$quantity',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  SizedBox(height: 16), // Increased space
                  if (widget.stock['company'] != 'Apple' &&
                      widget.stock['company'] != 'McDonald\'s')
                    Text(
                      'Total: KD $totalPrice',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  SizedBox(height: 20), // Increased space
                  if (widget.stock['company'] != 'Apple' &&
                      widget.stock['company'] != 'McDonald\'s')
                    ElevatedButton(
                      onPressed: () {
                        // Implement buy action
                      },
                      child: Text('Buy'),
                    ),
                ],
              ),
            ),
            SizedBox(height: 16), // Increased space
            Text(
              'Stock History',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: stockHistory.length,
                itemBuilder: (context, index) {
                  final historyItem = stockHistory[index];
                  return ListTile(
                    title: Text('Date: ${historyItem['date']}'),
                    subtitle: Text('Price: KD ${historyItem['price']}'),
                    trailing: Icon(
                      historyItem['isUp']
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      color: historyItem['isUp'] ? Colors.green : Colors.red,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
