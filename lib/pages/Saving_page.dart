import 'package:burgan_assistant/main.dart';
import 'package:burgan_assistant/pages/Financing_page.dart';
import 'package:burgan_assistant/providers/goals_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavingPage extends StatefulWidget {
  @override
  _SavingPageState createState() => _SavingPageState();
}

class _SavingPageState extends State<SavingPage> {
  final List<Goal> goals = [];
  final TextEditingController goalNameController = TextEditingController();
  final TextEditingController goalAmountController = TextEditingController();
  int? selectedDuration;
  double progress = 0.0;

  int _selectedIndex = 1; // Default index for SavingPage

  void addGoal() {
    final String goalName = goalNameController.text;
    final double goalAmount = double.tryParse(goalAmountController.text) ?? 0;
    if (goalName.isNotEmpty && goalAmount > 0 && selectedDuration != null) {
      setState(() {
        goals.add(Goal(
            name: goalName, amount: goalAmount, duration: selectedDuration!));
        goalNameController.clear();
        goalAmountController.clear();
        selectedDuration = null;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to FinancingPage when the "Financing" icon is tapped
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FinancingPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saving',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      offset: Offset(0, 5)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Why you should Save?',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            buildPoint(
                icon: Icons.savings,
                title: 'Monthly Savings',
                description:
                    'Your savings are automatically deducted and accumulate in your account.'),
            buildPoint(
                icon: Icons.access_time,
                title: 'Vacation? Car? Event?',
                description:
                    'Set goals and allocate funds to specific savings targets.'),
            buildPoint(
                icon: Icons.account_balance_wallet,
                title: 'Instant Deposit',
                description:
                    'As soon as you reach your goal amount, it’s deposited into your account.'),
            buildPoint(
                icon: Icons.check_circle_outline,
                title: 'Full Flexibility',
                description:
                    'Cancel anytime without commitments or penalties.'),
            SizedBox(height: 20),
            Text(
              "Let's Start",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: goalNameController,
                      decoration: InputDecoration(
                          labelText: 'Goal Name',
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.black)),
                      style: TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty) return "fill in the blanks";
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: goalAmountController,
                      decoration: InputDecoration(
                          labelText: 'How much do you want to save?',
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.black)),
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty) return "fill in the blanks";
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<int>(
                      value: selectedDuration,
                      validator: (value) {
                        if (value == null) return "fill in the blanks";
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Duration',
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.black)),
                      dropdownColor: Colors.white,
                      items: [1, 3, 6, 12].map((int duration) {
                        return DropdownMenuItem<int>(
                          value: duration,
                          child: Text("$duration month",
                              style: TextStyle(color: Colors.black)),
                        );
                      }).toList(),
                      onChanged: (int? newValue) {
                        setState(() {
                          selectedDuration = newValue;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) return;
                        formKey.currentState!.save();
                        context.read<GoalsProvider>().addGoal(Goal(
                            name: goalNameController.text,
                            amount: double.parse(goalAmountController.text),
                            duration: selectedDuration!));
                        scrollController
                            .jumpTo(scrollController.position.minScrollExtent);
                        ScaffoldMessenger.of(context).showMaterialBanner(
                            MaterialBanner(
                                content: Text("Goal has been created"),
                                actions: [
                              TextButton(
                                onPressed: ScaffoldMessenger.of(context)
                                    .removeCurrentMaterialBanner,
                                child: Text('DISMISS'),
                              ),
                            ]));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20)),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ...goals.map((goal) => GoalCard(goal: goal)).toList(),
          ],
        ),
      ),
      // Bottom navigation bar with "Financing" and "Saving" options
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.black, // Ensures selected icon is black
      //   unselectedItemColor: Colors.black,
      //   onTap: _onItemTapped,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.monetization_on),
      //       label: 'Financing',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.wallet),
      //       label: 'Saving',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.trending_up),
      //       label: 'Investment',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //   ],
      // ),
    );
  }

  Widget buildPoint(
      {required IconData icon,
      required String title,
      required String description}) {
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
                Text(title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(height: 4),
                Text(description,
                    style: TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class Goal {
//   final String name;
//   final double amount;
//   final String duration;

//   Goal({required this.name, required this.amount, required this.duration});
// }

class GoalCard extends StatelessWidget {
  final Goal goal;

  const GoalCard({Key? key, required this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = 0.5; // Placeholder progress value

    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Goal: ${goal.name}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(height: 8),
            Text('Amount: ${goal.amount}',
                style: TextStyle(fontSize: 16, color: Colors.black)),
            SizedBox(height: 8),
            Text('Duration: ${goal.duration}',
                style: TextStyle(fontSize: 16, color: Colors.black)),
            SizedBox(height: 8),
            LinearProgressIndicator(value: progress, minHeight: 8),
          ],
        ),
      ),
    );
  }
}
