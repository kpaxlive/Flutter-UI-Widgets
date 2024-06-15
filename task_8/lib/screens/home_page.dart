import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_8/components/segments.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double fWidth = 80;
  double fHeight = 65;
  int currentIndex = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CupertinoSegmentedControl(
              children: {
                0: Segment(
                  segmentWidth: fWidth,
                  segmentHeight: fHeight,
                  segmentText: "Neon Academy 2023",
                  colorize: Colors.yellow.shade400,
                ),
                1: Segment(
                    segmentWidth: fWidth,
                    segmentHeight: fHeight,
                    segmentText: "Neon",
                    colorize: Colors.green.shade400),
                2: Segment(
                  segmentWidth: fWidth,
                  segmentHeight: fHeight,
                  segmentText: "Apps",
                  colorize: Colors.blue.shade400,
                ),
              },
              onValueChanged: (int value) {
                setState(() {
                  currentIndex = value;
                  if (currentIndex == 0) {
                    fWidth = 100;
                    fHeight = 80;
                  } else if (currentIndex == 1) {
                    fWidth = 65;
                    fHeight = 50;
                  } else if (currentIndex == 2) {
                    fWidth = 40;
                    fHeight = 30;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
