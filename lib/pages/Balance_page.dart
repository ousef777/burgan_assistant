import 'package:burgan_assistant/navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BalancePage(),
  ));
}

final List<List> history = [
  ["text", 50],
  ["text1", 50],
  ["text2", 50],
  ["text", 50],
  ["text1", 50],
  ["text2", 50],
  ["text", 50],
  ["text1", 50],
  ["text2", 50],
  ["text", 50],
  ["text1", 50],
  ["text2", 50],
];

class BalancePage extends StatelessWidget {
  BalancePage({super.key});

  final List<Widget> tabs = [
    ListView.builder(
        //clipBehavior: Clip.antiAlias,
        shrinkWrap: true,
        itemCount: history.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide())),
            child: ListTile(
              leading: Text(history[index][0]),
              trailing: Text("${history[index][1]}"),
            ),
          );
        }),
    ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(history[index][0]),
            trailing: Text("${history[index][1]}"),
          );
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Balance Page"),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Container(
                margin: const EdgeInsets.all(50),
                padding: const EdgeInsets.all(30.0),
                child: const Text(
                  "Balance",
                  style: TextStyle(fontSize: 50),
                  textAlign: TextAlign.center,
                )),
          ),
          Expanded(
            child: Container(
              //color: Colors.red,
              decoration: BoxDecoration(border: Border.all()),
              margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              padding: const EdgeInsets.all(0.0),
              //height: 50,
              //width: 50,
              child: DefaultTabController(
                length: 2,
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  //decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      const TabBar(tabs: [
                        Tab(
                          text: "Income",
                        ),
                        Tab(
                          text: "Paid",
                        ),
                      ]),
                      Expanded(
                        child: TabBarView(children: tabs),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
