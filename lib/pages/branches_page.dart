import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MaterialApp(
    home: BranchesPage(),
  ));
}

class BankBranch {
  String name;
  String address;
  String hours;

  BankBranch({required this.name, required this.address, required this.hours});
}

class BranchesPage extends StatelessWidget {
  BranchesPage({super.key});

  final List<BankBranch> burganBankBranches = [
    BankBranch(
        name: "Sharq",
        address: "Abdullah Al Ahmad Street, Block 1, Plot 21",
        hours: "Sunday – Thursday: 8:30 am – 3:00 pm"),
    BankBranch(
        name: "Fahad Al Salem",
        address: "Fahad Al Salem St., Al-Salhyiah",
        hours:
            "Sunday – Wednesday: 9:00 am – 1:00 pm; 5:00 pm – 7:00 pm, Thursday: 9:00 am – 1:00 pm"),
    BankBranch(
        name: "Marina Mall",
        address: "Salem Al-Mubarak St., Salmiya",
        hours:
            "Sunday – Wednesday: 9:00 am – 1:00 pm; 5:00 pm – 7:00 pm, Thursday: 9:00 am – 1:00 pm"),
    BankBranch(
        name: "Al-Salmiya",
        address: "Salem Al Mubarak St., Block 21",
        hours:
            "Sunday – Wednesday: 9:00 am – 1:00 pm; 5:00 pm – 7:00 pm, Thursday: 9:00 am – 1:00 pm"),
    BankBranch(
        name: "Al-Adailiya",
        address: "Adailiya Cooperative, Block 4",
        hours: "Sunday – Thursday: 8:30 am – 3:00 pm"),
    BankBranch(
        name: "Shuwaikh Residential",
        address: "Shuwaikh Residential Area 2",
        hours: "Sunday – Thursday: 8:30 am – 3:00 pm"),
    BankBranch(
        name: "Shuwaikh Industrial",
        address: "Shuwaikh Industrial Area, Plot 102",
        hours:
            "Sunday – Wednesday: 9:00 am – 1:00 pm; 5:00 pm – 7:00 pm, Thursday: 9:00 am – 1:00 pm"),
    BankBranch(
        name: "Farwaniya",
        address: "Al-Maghateer Mall, Farwaniya",
        hours:
            "Sunday – Wednesday: 9:00 am – 1:00 pm; 5:00 pm – 7:00 pm, Thursday: 9:00 am – 1:00 pm"),
    BankBranch(
        name: "Airport",
        address: "Kuwait Airport",
        hours: "Sunday – Monday: 24 hours"),
    BankBranch(
        name: "Sabhan",
        address: "Sabhan Industrial Area 5",
        hours: "Sunday – Thursday: 8:30 am – 3:00 pm")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Branches"),
          backgroundColor: Colors.lightBlue,
        ),
        body: ListView.builder(
            itemCount: burganBankBranches.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    //GoRouter.of(context).push("/details_page", extra: burganBankBranches[index]);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/Head.jpg",
                        width: 100,
                        height: 100,
                      ),
                      Text(burganBankBranches[index].name,
                          style: const TextStyle(fontSize: 28)),
                      //Text("area", style: const TextStyle(fontSize: 28)),
                    ],
                  ),
                ),
              );
            }));
  }
}
