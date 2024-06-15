import 'package:flutter/material.dart';

class ButtonThree extends StatefulWidget {
  const ButtonThree({super.key});

  @override
  State<ButtonThree> createState() => _ButtonThreeState();
}

class _ButtonThreeState extends State<ButtonThree> {
  final TextEditingController _controller = TextEditingController();
  bool showText = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                        title: const Text('Textfield Alert'),
                        content: Text("This is a alert with a textfield"),
                        actions: [
                          TextField(
                            controller: _controller,
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  showText = true;
                                });
                                Navigator.pop(context);
                              },
                              child: const Text("Print"))
                        ]);
                  });
            },
            child: const Text("Button 3")),
        if (showText) Text('Textfield content: ${_controller.text}'),
      ],
    );
  }
}
