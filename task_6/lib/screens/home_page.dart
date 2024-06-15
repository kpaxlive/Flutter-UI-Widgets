import 'package:flutter/material.dart';
import 'package:task_6/components/custom_divider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State {
  int currentStep = 0;
  int stepLength = 11;
  int stepValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade300,
      body: Stepper(
        controlsBuilder: (context, details) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        _increment();
                      },
                      child: Image.asset(
                        "assets/images/doll1.png",
                        scale: 7,
                      )),
                  GestureDetector(
                      onTap: () {
                        _decrement();
                      },
                      child: Image.asset(
                        "assets/images/doll2.png",
                        scale: 12,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Dress Value: $stepValue",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomDivider(
                color: Colors.blue,
                height: 10,
                width: 300,
              ),
            ],
          );
        },
        currentStep: currentStep,
        steps: List.generate(stepLength, (index) {
          return Step(
            title: Text("Dress Value: ${index * 5}"),
            content: Container(
              height: 10,
            ),
          );
        }),
      ),
    );
  }

  void _increment() {
    setState(() {
      if (currentStep < stepLength - 1) {
        currentStep++;
      }
      if (stepValue < 46) {
        stepValue += 5;
      }
    });
  }

  void _decrement() {
    setState(() {
      if (currentStep >= 1) {
        currentStep--;
      }
      if (stepValue > 4) {
        stepValue -= 5;
      }
    });
  }
}

