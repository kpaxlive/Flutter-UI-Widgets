import 'package:flutter/material.dart';

class TwoButtons extends StatefulWidget {
  const TwoButtons({super.key});

  @override
  State<TwoButtons> createState() => _TwoButtonsState();
}

class _TwoButtonsState extends State<TwoButtons> {
  bool allowButton = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: allowButton ? (){} : null, 
          child: Text("First Button")),

          ElevatedButton(onPressed: (){
            setState(() {
              allowButton = !allowButton;
            });
          },
          child: Text("Second Button"))
        ],
      ),
    );
  }
}