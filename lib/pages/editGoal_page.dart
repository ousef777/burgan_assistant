import 'package:burgan_assistant/pages/Financing_page.dart';
import 'package:burgan_assistant/pages/investment_page.dart';
import 'package:burgan_assistant/providers/goals_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditgoalPage extends StatefulWidget {
  final int index;
  const EditgoalPage({super.key, required this.index});

  @override
  _EditgoalPageState createState() => _EditgoalPageState();
}

class _EditgoalPageState extends State<EditgoalPage> {
  // final List<Goal> goals = [];
  int? selectedDuration;
  double progress = 0.0;
  //(String, int, int) outcome;
  //_EditgoalPageState(this.outcome);
  final TextEditingController goalNameController = TextEditingController();
  final TextEditingController goalAmountController = TextEditingController();

  String? selectedGoalName;
  //int? selectedDuration;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // index = widget.index;

    var list = context.read<GoalsProvider>().list;

    setValues(list[widget.index]);
  }

  void setValues(Goal goal) {
    selectedGoalName = goal.name;
    selectedDuration = goal.duration;
    goalNameController.text = goal.name;
    goalAmountController.text = "${goal.amount}";
  }

  // void addGoal() {
  //   final String goalName = goalNameController.text;
  //   final double goalAmount = double.tryParse(goalAmountController.text) ?? 0;
  //   if (goalName.isNotEmpty && goalAmount > 0 && selectedDuration != null) {
  //     setState(() {
  //       goals.add(Goal(
  //           name: goalName,
  //           amount: goalAmount,
  //           duration: int.parse(selectedDuration!)));
  //       goalNameController.clear();
  //       goalAmountController.clear();
  //       selectedDuration = null;
  //     });
  //   }
  // }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });

  //   // Navigate to FinancingPage when the "Financing" icon is tapped
  //   if (index == 0) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => FinancingPage()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var list = context.read<GoalsProvider>().list;
    var goal = list.firstWhere((goal) => goal.name == selectedGoalName);
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
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField<Goal>(
                    value: goal,
                    decoration: InputDecoration(
                        //labelText: 'Selected Goal',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black)),
                    dropdownColor: Colors.white,
                    hint: Text("Select Goal"),
                    // value: Dropdown,
                    items: list.map((g) {
                      return DropdownMenuItem(value: g, child: Text(g.name));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedGoalName = value?.name;
                        setValues(value!);
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    //initialValue: goal.name,
                    controller: goalNameController,
                    decoration: InputDecoration(
                        labelText: 'Goal Name',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black)),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    //initialValue: "${goal.amount}",
                    controller: goalAmountController,
                    decoration: InputDecoration(
                        labelText: 'How much do you want to save?',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black)),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<int>(
                    value: selectedDuration,
                    decoration: InputDecoration(
                        labelText: 'Duration',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black)),
                    dropdownColor: Colors.white,
                    items: [1, 2, 3, 4].map((int duration) {
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
                      //addgoal
                      context.read<GoalsProvider>().updateGoal(Goal(
                          name: goalNameController.text,
                          amount:
                              double.tryParse(goalAmountController.text) ?? 0,
                          duration: selectedDuration ?? 0));
                      ScaffoldMessenger.of(context).showMaterialBanner(
                          MaterialBanner(
                              content: Text("Goal has been updated"),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20)),
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
            SizedBox(height: 20),
            ...context
                .read<GoalsProvider>()
                .list
                .map((goal) => GestureDetector(
                    onTap: () {
                      setState(() {
                        setValues(goal);
                      });
                    },
                    child: GoalCard(goal: goal)))
                .toList(),
          ],
        ),
      ),
    );
  }
}

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
