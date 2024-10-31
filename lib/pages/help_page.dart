import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HelpPage(),
  ));
}

class Info {
  String title;
  String? subtitle;

  Info(this.title, [this.subtitle]);
}

class HelpPage extends StatelessWidget {
  HelpPage({super.key});

  final List<Info> list = [
    Info("Call Center", "+965 1804080"),
    Info("International Call", "+965 22988000"),
    // Info("Apple messages"),
    Info("Whatsapp", "+965 1804080"),
    Info("Contact us", "info@burgan.com")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Page"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Text(
                "Here are the options",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                ...list.map(
                  (e) => createListTile(e),
                )
                //createListTile("Data")
              ],
            )
          ],
        ),
      ),
    );
  }

  ListTile createListTile(Info data) {
    return ListTile(
      shape: BorderDirectional(bottom: BorderSide()),
      title: Text(
        data.title,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: (data.subtitle != null) ? Text(data.subtitle ?? "") : null,
      //trailing: Icon(Icons.keyboard_arrow_right_outlined),
      onTap: () {},
    );
  }
}
