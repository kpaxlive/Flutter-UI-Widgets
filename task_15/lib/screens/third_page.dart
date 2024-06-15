import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_15/data/profile_info.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  DateTime dateTime = DateTime(2024, 2, 1, 10, 20);
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<ProfileInfo>(context);
    return Scaffold(
      backgroundColor: userProvider.color ?? Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,), onPressed: () => Navigator.pop(context),),
        title: const Text(
          "Choose Your Age",
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 35,
              color: Colors.white,
              decorationColor: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${dateTime.day}-${dateTime.month}-${dateTime.year}'),
          Center(
              child: ElevatedButton(
                  child: const Text("Select Your Birthday"),
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        userProvider.setAge(ageCalculate());
                                        Navigator.pushNamed(
                                            context, '/fourthPage');
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 50),
                                        child: const Text("Done"),
                                      )),
                                  Expanded(
                                    child: CupertinoDatePicker(
                                      backgroundColor: Colors.white,
                                      initialDateTime: dateTime,
                                      onDateTimeChanged: (DateTime newTime) {
                                        setState(() {
                                          dateTime = newTime;
                                        });
                                      },
                                      mode: CupertinoDatePickerMode.date,
                                    ),
                                  ),
                                ],
                              ),
                            ));
                  })),
        ],
      ),
    );
  }

  int? ageCalculate() {
    int year = DateTime.now().year - dateTime.year;
    int month = DateTime.now().month - dateTime.month;
    int age;

    if (year < 0 || (year == 0 && month < 0)) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Wrong Choice!"),
              content: const Text("Please choose a valid birthday"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            );
          });
    } else {
      age = (month < 0) ? (year - 1) : year;
      return age;
    }
    return null;
  }
}
