import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showContent = false;
  int start = 0;
  Color color = Colors.purple.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showContent) CircularProgressIndicator(color: color),
            const SizedBox(width: 15),
            if (showContent) Text(start.toString()),
            const SizedBox(width: 15),
            if (showContent)
              CircularPercentIndicator(
                animation: false,
                animationDuration: start,
                radius: 20,
                progressColor: color,
                percent: start / 50,
              ),
            if (!showContent)
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showContent = true;
                      startTimer();
                    });
                  },
                  child: const Text("Start Timer")),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 50) {
          setState(() {
            showContent = false;
            timer.cancel();
            start = 0;
          });
          }
        else {
          setState(() {
            if((start % 10) == 0)
            {
              color = _getDifferentShade(start ~/ 10);
            }
            start++;
          });
        }
      },
    );
  }
  
  Color _getDifferentShade(int index) 
  {
    List<Color> colors = [Colors.yellow.shade300, Colors.orange.shade400,Colors.red.shade400,Colors.purple.shade400,Colors.black87];
    return colors[index];
  }
}
