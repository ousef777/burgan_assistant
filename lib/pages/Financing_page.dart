import 'package:flutter/material.dart';
import 'package:burgan_assistant/pages/Saving_page.dart';
import 'request_appointment_page.dart'; // Import the new page
import 'investment_page.dart';

class FinancingPage extends StatefulWidget {
  @override
  _FinancingPageState createState() => _FinancingPageState();
}

class _FinancingPageState extends State<FinancingPage> {
  int _selectedIndex = 0;
  String _selectedFinancial = 'Car Financing'; // Default selection
  double _salary = 0;
  int _installmentDuration = 1; // Default to 1 month
  double _financingAmount = 1000; // Default financing amount
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
    if (_financingAmount > 0 && _salary > 0 && _installmentDuration > 0) {
      double installment = (_financingAmount + _salary) / _installmentDuration;
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

  void _updateFinancingAmountOptions() {
    setState(() {
      if (_selectedFinancial == 'Car Financing') {
        _financingAmount = 1000;
      } else if (_selectedFinancial == 'Home Financing') {
        _financingAmount = 5000;
      } else if (_selectedFinancial == 'Study Financing') {
        _financingAmount = 1500;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F1F9),
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
        elevation: 0,
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
            Text(
              'Finance',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Our financing options offer flexible solutions tailored to your needs.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              "Let's calculate how much we will get from your salary monthly:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Choose your Financial:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedFinancial,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFinancial = newValue!;
                  _updateFinancingAmountOptions();
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
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            Text(
              "Select Financing Amount:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            DropdownButtonFormField<double>(
              value: _financingAmount,
              onChanged: (double? newValue) {
                setState(() {
                  _financingAmount = newValue!;
                });
              },
              items: List.generate(
                _selectedFinancial == 'Car Financing'
                    ? 25
                    : _selectedFinancial == 'Home Financing'
                        ? 50
                        : 15,
                (index) => DropdownMenuItem<double>(
                  value: (index + 1) * 1000,
                  child: Text(
                    'KD ${(index + 1) * 1000}',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Put your salary:',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _salary = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              "Installment Duration:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            Row(
              children: [
                // Duration dropdown with smaller width
                Expanded(
                  flex: 2,
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
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2, // Slightly smaller flex for the "Calculate" button
                  child: ElevatedButton(
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
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              _installmentResult,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
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
                  backgroundColor: Colors.blue,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
