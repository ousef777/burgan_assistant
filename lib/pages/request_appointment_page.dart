import 'package:flutter/material.dart';

class RequestAppointmentPage extends StatefulWidget {
  @override
  _RequestAppointmentPageState createState() => _RequestAppointmentPageState();
}

class _RequestAppointmentPageState extends State<RequestAppointmentPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _selectedFinanceType = 'Car Financing';

  void _submitRequest() {
    // Display a success message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(
              'Your request is submitted successfully. Soon we will send the appointment details.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context)
                    .pop(); // Navigate back to the previous page
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Requesting an Appointment',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold), // Bold black text
        ),
        backgroundColor: Colors.white, // White AppBar
      ),
      body: Container(
        color: Colors.white, // White background
        padding: const EdgeInsets.all(20.0), // Increased padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Burgan Finance',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black), // Black text
            ),
            SizedBox(height: 15), // Increased spacing
            Text(
              'Financing with Burgan is easy. You can request an appointment online and we will contact you shortly.',
              style: TextStyle(
                  fontSize: 18, color: Colors.black), // Increased font size
            ),
            SizedBox(height: 50), // Increased spacing
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.black), // Black text
            ),
            SizedBox(height: 15), // Increased spacing
            TextField(
              controller: _numberController,
              decoration: InputDecoration(
                labelText: 'Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.black), // Black text
            ),
            SizedBox(height: 15), // Increased spacing
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black), // Black text
            ),
            SizedBox(height: 15), // Increased spacing
            // Dropdown for selecting finance type
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Finance Type', // Set label text here
                border: OutlineInputBorder(),
              ),
              value: _selectedFinanceType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFinanceType = newValue!;
                });
              },
              items: <String>[
                'Car Financing',
                'Home Financing',
                'Study Financing'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: TextStyle(color: Colors.black)), // Black text
                );
              }).toList(),
            ),
            SizedBox(height: 20), // Increased spacing
            Spacer(), // Spacer to push the buttons down
            // Buttons for submitting or cancelling the request
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _submitRequest,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30), // Increased button size
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18 // Increased font size
                          ),
                    ), // White text
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Black background
                    minimumSize: Size(150, 50), // Minimum size for button
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Cancel action
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30), // Increased button size
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18 // Increased font size
                          ),
                    ), // White text
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Black background
                    minimumSize: Size(150, 50), // Minimum size for button
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Spacing at the bottom
          ],
        ),
      ),
    );
  }
}
