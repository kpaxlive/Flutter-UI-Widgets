import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_15/data/profile_info.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({super.key});

  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State {
  String _selectedFont = "Roboto";

  final List<String> _fontList = [
    "Roboto",
    "Arial",
    "Times New Roman",
    "Courier New",
    "Verdana",
    "Georgia",
    "Comic Sans MS",
  ];

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<ProfileInfo>(context);
    return Scaffold(
      backgroundColor: userProvider.color ?? Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,), onPressed: () => Navigator.pop(context),),
        title: const Text(
          "Choose Your Font",
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 35,
              color: Colors.white,
              decorationColor: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  value: _selectedFont,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedFont = newValue;
                        userProvider.setFont(_selectedFont);
                      });
                    }
                  },
                  items:  _fontList.map((String font) {
                    return DropdownMenuItem(
                      value: font,
                      child: Text(font),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  'Font: $_selectedFont',
                  style: TextStyle(
                    fontFamily: _selectedFont,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'The quick brown fox jumped',
                  style: TextStyle(
                    fontFamily: _selectedFont,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'over the lazy dog',
                  style: TextStyle(
                    fontFamily: _selectedFont,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
