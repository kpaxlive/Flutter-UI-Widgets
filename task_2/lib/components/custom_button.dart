import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Color _buttonColor = Colors.blue;

  void _highlightButton() {
    setState(() {
      _buttonColor = Colors.yellow;
    });
  }

  void _resetButtonColor() {
    setState(() {
      _buttonColor = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        _highlightButton();
      },
      onTapUp: (TapUpDetails details) {
        _resetButtonColor();
      },
      onTapCancel: () {
        _resetButtonColor();
      },
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
            color: _buttonColor,
            border: Border.all(width: 4, color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
        child: const Center(
            child: Text("Custom Button",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple))),
      ),
    );
  }
}
