import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BalancePage(),
  ));
}

// Expanded account activity with more income and paid transactions
final List<Map<String, dynamic>> incomeHistory = [
  {
    "description": "Car Financing",
    "amount": 15000,
    "date": "2024-10-30",
    "time": "10:15 AM"
  },
  {
    "description": "Income from Savings Account",
    "amount": 100.00,
    "date": "2024-10-28",
    "time": "9:00 AM"
  },
  {
    "description": "Mcdonalds Shares",
    "amount": 95.00,
    "date": "2024-10-27",
    "time": "12:30 PM"
  },
  {
    "description": "Apple shares ",
    "amount": 50.00,
    "date": "2024-10-26",
    "time": "3:15 PM"
  },
  {
    "description": "Google Shares",
    "amount": 150.75,
    "date": "2024-10-25",
    "time": "5:45 PM"
  },
  {
    "description": "Savings ",
    "amount": 1000.00,
    "date": "2024-10-24",
    "time": "11:00 AM"
  },
  {
    "description": "Earnings from Shares",
    "amount": 65.50,
    "date": "2024-10-23",
    "time": "6:30 PM"
  },
];

final List<Map<String, dynamic>> paidHistory = [
  {
    "description": "Financing Payment",
    "amount": -200.00,
    "date": "2024-10-29",
    "time": "2:30 PM"
  },
  {
    "description": "Apple shares",
    "amount": -175.50,
    "date": "2024-10-28",
    "time": "5:30 PM"
  },
  {
    "description": "Saving Payment",
    "amount": -50.00,
    "date": "2024-10-27",
    "time": "11:00 AM"
  },
  {
    "description": "saving payment",
    "amount": -45.00,
    "date": "2024-10-26",
    "time": "8:00 PM"
  },
  {
    "description": "Transportation",
    "amount": -15.00,
    "date": "2024-10-25",
    "time": "7:15 AM"
  },
  {
    "description": "Internet Bill",
    "amount": -30.00,
    "date": "2024-10-24",
    "time": "3:00 PM"
  },
  {
    "description": "Credit Card Payment",
    "amount": -100.00,
    "date": "2024-10-23",
    "time": "4:30 PM"
  },
  {
    "description": "Gym Membership",
    "amount": -40.00,
    "date": "2024-10-22",
    "time": "9:00 AM"
  },
];

class BalancePage extends StatelessWidget {
  BalancePage({super.key});

  final List<Widget> tabs = [
    // Income Tab
    ListView.builder(
      shrinkWrap: true,
      itemCount: incomeHistory.length,
      itemBuilder: (context, index) {
        final transaction = incomeHistory[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
              ),
            ],
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: ListTile(
            title: Text(transaction["description"]),
            subtitle: Text("${transaction["date"]} at ${transaction["time"]}"),
            trailing: Text(
              "${transaction["amount"]} KWD",
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    ),
    // Paid Tab
    ListView.builder(
      itemCount: paidHistory.length,
      itemBuilder: (context, index) {
        final transaction = paidHistory[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
              ),
            ],
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: ListTile(
            title: Text(transaction["description"]),
            subtitle: Text("${transaction["date"]} at ${transaction["time"]}"),
            trailing: Text(
              "${transaction["amount"]} KWD",
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Balance Page"),
      ),
      body: Column(
        children: [
          // Main Card at the top with account details and shadow effect
          Card(
            elevation: 4, // Adds elevation to give shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            child: Container(
              margin: const EdgeInsets.all(16),
              padding:
                  const EdgeInsets.all(24), // Increased padding for spacing
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5), // Shadow position
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Premier Account",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red, // Customize color if needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "0514008001", // Account number
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Available Balance",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "15586 KWD",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.blue, // Customize color if needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Box containing Income and Paid tabs
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15), // Rounded borders
              ),
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: DefaultTabController(
                length: 2,
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(
                            child: Text(
                              "Income",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Paid",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(children: tabs),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
