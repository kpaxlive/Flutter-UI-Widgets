import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearProgressIndicator(
                color: Colors.blue,
                minHeight: (progress * 2) + 1,
                backgroundColor: Colors.black54,
                value: progress / 10,
                borderRadius: BorderRadius.circular(25),
              ),
              const SizedBox(height: 14),
              Text("Current Progress: $progress"),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      progress++;
                      if (progress == 10) {
                        progress = 0;
                      }
                    });
                  },
                  child: const Text("Progress Completed")),
            ],
          ),
        ),
      ),
    );
  }
}
