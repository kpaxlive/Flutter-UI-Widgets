import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameSurnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isTrue = true;
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  void dispose() {
    _nameSurnameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              TextField(
                controller: _nameSurnameController,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name-Surname',
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                },
              ),

              const SizedBox(height: 25),

              //
              TextField(
                controller: _emailController,
                style: const TextStyle(
                    color: Colors.blue, fontStyle: FontStyle.italic),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Email',
                  errorText: isTrue ? null : "Pls enter a valid email",
                ),
                onChanged: (value) {
                  setState(() {
                    isTrue = emailRegex.hasMatch(value);
                  });
                },
              ),

              const SizedBox(height: 25),

              //
              TextField(
                controller: _phoneNumberController,
                maxLength: 10,
                style: const TextStyle(
                    color: Colors.green, decoration: TextDecoration.underline),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Phone Number',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
