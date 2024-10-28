import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          elevation: 12,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {},
                child: const ListTile(
                  title: Text("Sign in"),
                ),
              ),
              ListTile(
                title: Text("Sign up"),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Container(
                      padding: const EdgeInsets.all(50.0),
                      child: const Text(
                        "Balance",
                        style: TextStyle(fontSize: 80),
                        textAlign: TextAlign.center,
                      )),
                ),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      //physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 50,
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Goal $index",
                                    style: const TextStyle(fontSize: 50),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 5,
                                    width: 100,
                                    child: LinearProgressBar(
                                      maxSteps: 6,
                                      progressType: LinearProgressBar
                                          .progressTypeLinear, // Use Linear progress
                                      currentStep: 1,
                                      progressColor: Colors.red,
                                      backgroundColor: Colors.grey,
                                      borderRadius:
                                          BorderRadius.circular(10), //  NEW
                                    ),
                                  )
                                ],
                              )),
                        );
                      }),
                ),
                Card(
                  child: Container(
                      padding: const EdgeInsets.all(80.0),
                      child: const Text(
                        "TM",
                        style: TextStyle(fontSize: 100),
                        textAlign: TextAlign.center,
                      )),
                ),
                Card(
                  child: Container(
                      padding: const EdgeInsets.all(50.0),
                      child: const Text(
                        "Invest",
                        style: TextStyle(fontSize: 50),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
