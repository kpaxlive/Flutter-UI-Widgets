import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Specials Of The Day'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      '1. Grilled Salmon with Lemon Butter Sauce',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '2. BBQ Pulled Pork Sandwich with Coleslaw',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '3. Veggie Stir Fry with Tofu',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '4. Classic Cheeseburger with Fries',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '5. Margherita Pizza with Fresh Basil',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Approve'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.blue.shade900),
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
          gradient: LinearGradient(
            colors: [Colors.red, Colors.red.withOpacity(0.5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: const DecorationImage(
              image: AssetImage("assets/images/button.png"), fit: BoxFit.cover),
          boxShadow: const [
            BoxShadow(
              offset: Offset(4, 4),
              color: Colors.black,
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: const Center(
            child: Text("My Button",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
      ),
    );
  }
}
