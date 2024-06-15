import 'package:flutter/material.dart';

class ButtonOne extends StatefulWidget {
  const ButtonOne({super.key});

  @override
  State<ButtonOne> createState() => _ButtonOneState();
}

class _ButtonOneState extends State<ButtonOne> {
  String fButtonTitle = 'OK';
  bool fShowTitle = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Alert 1'),
                  content: const Text('This is the first alert'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        showSecondAlertDialog(context);
                      },
                      child: const Text('Next'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Button 1'),
        ),
        if (fShowTitle) Text('Button title is: $fButtonTitle'),
      ],
    );
  }

  void showSecondAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert 2'),
          content: const Text('This is the second alert'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  fShowTitle = true;
                });
              },
              child: Text(fButtonTitle),
            ),
          ],
        );
      },
    );
  }
}
