import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color bodyColor = Colors.green.shade300;
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      body: Center(
        child: Switch(
          value: switchValue,
          thumbColor: MaterialStateProperty.all(Colors.black),
          activeTrackColor: Colors.green,
          inactiveTrackColor: Colors.red,
          onChanged: (value) {
            setState(() {
              switchValue = !switchValue;
              bodyColor = (bodyColor == Colors.red.shade700)
                  ? Colors.green.shade300
                  : Colors.red.shade700;
            });
          },
        ),
      ),
    );
  }
}
