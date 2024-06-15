
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.yellow.shade300,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text("Magicum Penetrum")),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade300,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text("Oculus Reparo")),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text("Imferedem Secrum")),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade300,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text("Expecto Patronus")),
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
