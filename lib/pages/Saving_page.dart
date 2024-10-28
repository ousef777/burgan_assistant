import 'package:flutter/material.dart';

class SavingPage extends StatefulWidget {
  @override
  _SavingPageState createState() => _SavingPageState();
}

class _SavingPageState extends State<SavingPage> {
  // Controller for holding the user's saving goals
  final List<Goal> goals = [];
  final TextEditingController goalNameController = TextEditingController();
  final TextEditingController goalAmountController = TextEditingController();
  String? selectedDuration; // Stores the selected duration for each goal
  double progress = 0.0; // Placeholder progress value

  int _selectedIndex = 0; // Stores the selected index of the navigation bar

  // Method to add a new saving goal
  void addGoal() {
    // Extract goal name and amount from input fields
    final String goalName = goalNameController.text;
    final double goalAmount = double.tryParse(goalAmountController.text) ?? 0;
    if (goalName.isNotEmpty && goalAmount > 0 && selectedDuration != null) {
      setState(() {
        // Adds new goal to list and resets input fields
        goals.add(Goal(
            name: goalName, amount: goalAmount, duration: selectedDuration!));
        goalNameController.clear();
        goalAmountController.clear();
        selectedDuration = null;
      });
    }
  }

  // Update the index when a new navigation item is selected
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set screen background to white
      appBar: AppBar(
        toolbarHeight: 80, // Increase height of AppBar
        title: Text(
          'Saving',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black, // Set AppBar title to black
          ),
        ),
        backgroundColor: Colors.white, // Set AppBar background to white
        iconTheme:
            IconThemeData(color: Colors.black), // Set AppBar icons to black
        elevation: 0, // Remove AppBar shadow
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container for displaying an image with shadow effect
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage('assets/images/goals.jpg'),
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
            // Title for "Why you should Save?" section
            Text(
              'Why you should Save?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            // Benefit points section for saving
            buildPoint(
              icon: Icons.savings,
              title: 'Monthly Savings',
              description:
                  'Your savings are automatically deducted and accumulate in your account.',
            ),
            buildPoint(
              icon: Icons.access_time,
              title: 'Vacation? Car? Event?',
              description:
                  'Set goals and allocate funds to specific savings targets.',
            ),
            buildPoint(
              icon: Icons.account_balance_wallet,
              title: 'Instant Deposit',
              description:
                  'As soon as you reach your goal amount, it’s deposited into your account.',
            ),
            buildPoint(
              icon: Icons.check_circle_outline,
              title: 'Full Flexibility',
              description: 'Cancel anytime without commitments or penalties.',
            ),
            SizedBox(height: 20),
            // Section heading for starting a new goal
            Text(
              "Let's Start",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            // Input form container for adding new goals
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black), // Border color
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TextField for goal name input
                  TextField(
                    controller: goalNameController,
                    decoration: InputDecoration(
                      labelText: 'Goal Name',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  // TextField for goal amount input
                  TextField(
                    controller: goalAmountController,
                    decoration: InputDecoration(
                      labelText: 'How much do you want to save?',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  // Dropdown for selecting goal duration
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Duration',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    dropdownColor: Colors.white,
                    items: [
                      '1 month',
                      '2 months',
                      '3 months',
                      '6 months',
                      '1 year'
                    ].map((String duration) {
                      return DropdownMenuItem<String>(
                        value: duration,
                        child: Text(duration,
                            style: TextStyle(color: Colors.black)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDuration = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  // Button to submit the goal
                  ElevatedButton(
                    onPressed: addGoal,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Display each goal in a list of GoalCards
            ...goals.map((goal) => GoalCard(goal: goal)).toList(),
          ],
        ),
      ),
      // Bottom navigation bar with shadow effect
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              spreadRadius: 2, // Spread radius of the shadow
              blurRadius: 8, // Blur radius for a soft shadow
              offset: Offset(0, -3), // Positioning shadow above the navbar
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
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
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  // Widget for each benefit point in "Why you should Save?" section
  Widget buildPoint({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: Colors.black),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Model class to represent each saving goal
class Goal {
  final String name;
  final double amount;
  final String duration;

  Goal({required this.name, required this.amount, required this.duration});
}

// Card widget to display each goal with a progress bar
class GoalCard extends StatelessWidget {
  final Goal goal;

  const GoalCard({Key? key, required this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = 0.5; // Placeholder progress value

    return Card(
      color: Colors.white,
      elevation: 4, // Adds elevation for a card shadow
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Goal: ${goal.name}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Amount: ${goal.amount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              'Duration: ${goal.duration}',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
