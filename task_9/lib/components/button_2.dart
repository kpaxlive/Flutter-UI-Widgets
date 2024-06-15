import 'package:flutter/material.dart';

class ButtonTwo extends StatefulWidget {
  const ButtonTwo({super.key});

  @override
  State<ButtonTwo> createState() => _ButtonTwoState();
}

class _ButtonTwoState extends State<ButtonTwo> {

  String sButtonTitleOne = 'Button 1';
  String sButtonTitleTwo = 'Button 2';
  bool sShowTitleOne = false;
  bool sShowTitleTwo = false;

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
                          title: const Text('First Alert'),
                          content: const Text('This is the first alert'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    sShowTitleOne = true;
                                  });
                                },
                                child: Text(sButtonTitleOne)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    sShowTitleTwo = true;
                                  });
                                },
                                child: Text(sButtonTitleTwo)),
                          ],
                        );
                      });
                },
                child: const Text("Button 2")),
            if (sShowTitleOne) Text("Button one's title = $sButtonTitleOne"),
            if (sShowTitleTwo) Text("Button one's title = $sButtonTitleTwo"),
      ],
    );
  }
}