import 'package:flutter/material.dart';
import 'package:burgan_assistant/pages/Saving_page.dart';
import 'request_appointment_page.dart'; // Import the new page

class FinancingPage extends StatefulWidget {
  @override
  _FinancingPageState createState() => _FinancingPageState();
}

class _FinancingPageState extends State<FinancingPage> {
  int _selectedIndex = 0;
  String _selectedFinancial = 'Car Financing'; // Default selection
  double _salary = 0;
  int _installmentDuration = 1; // Default to 1 month
  String _installmentResult = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the SavingPage when the "Saving" icon is tapped
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SavingPage()),
      );
    }
  }

  void _calculateInstallment() {
    // Calculate installment based on salary and duration
    if (_salary > 0 && _installmentDuration > 0) {
      double installment = _salary / _installmentDuration; // Simple calculation
      setState(() {
        _installmentResult =
            'Your monthly installment: KD ${installment.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        _installmentResult = 'Please enter valid values.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Financing',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Financing image with rounded corners and shadow
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage('assets/images/financ.jpeg'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Finance heading
            Text(
              'Finance',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            // Description paragraph
            Text(
              'Our financing options offer flexible solutions tailored to your needs. Whether you’re looking to finance a car, a home, or your studies, Burgan Bank in Kuwait is here to support you.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 20),
            // New section for calculating installment
            Text(
              "Let's calculate how much we will get from your salary monthly:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            // New section for choosing financial option
            Text(
              "Choose your Financial:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10),
            // Dropdown for selecting financial option
            DropdownButtonFormField<String>(
              value: _selectedFinancial,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFinancial = newValue!;
                });
              },
              items: <String>[
                'Car Financing',
                'Home Financing',
                'Study Financing'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.black)),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Text field for salary input
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Put your salary:',
                labelStyle: TextStyle(color: Colors.black),
              ),
              onChanged: (value) {
                setState(() {
                  _salary = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 10),
            // Dropdown for installment duration
            Text(
              "Installment Duration:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: _installmentDuration,
                    onChanged: (int? newValue) {
                      setState(() {
                        _installmentDuration = newValue!;
                      });
                    },
                    items: [
                      for (int i = 1; i <= 11; i++)
                        DropdownMenuItem<int>(
                          value: i,
                          child: Text('$i month${i > 1 ? 's' : ''}',
                              style: TextStyle(color: Colors.black)),
                        ),
                      for (int i = 1; i <= 15; i++)
                        DropdownMenuItem<int>(
                          value: i + 11,
                          child: Text('$i year${i > 1 ? 's' : ''}',
                              style: TextStyle(color: Colors.black)),
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 10), // Space between dropdown and button
                ElevatedButton(
                  onPressed: _calculateInstallment,
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Button background color
                    padding: EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0), // Increased padding
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Displaying the installment result
            Text(
              _installmentResult,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            // Place a request button, centered
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RequestAppointmentPage()),
                  );
                },
                child: Text(
                  'Place a request',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button background color
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0), // Increased padding
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom navigation bar with "Financing" and "Saving" options
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Financing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.savings),
            label: 'Saving',
          ),
        ],
      ),
      backgroundColor:
          Colors.white, // Set the background color of the screen to white
    );
  }
}
