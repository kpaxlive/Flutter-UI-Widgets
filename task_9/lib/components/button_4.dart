import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ButtonFour extends StatefulWidget {
  const ButtonFour({super.key});

  @override
  State<ButtonFour> createState() => _ButtonFourState();
}

class _ButtonFourState extends State<ButtonFour> {
  String message = "Merhaba!";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text("Action Sheet"),
                  message: const Text("Please choose an item"),
                  actions: [
                    CupertinoActionSheetAction(
                        onPressed: () {}, child: const Text("Action 1")),
                    CupertinoActionSheetAction(
                        onPressed: () {}, child: const Text("Action 2")),
                    CupertinoActionSheetAction(
                        onPressed: () async {
                          final result = await Share.share(
                              'check out my website https://example.com');

                          if (result.status == ShareResultStatus.success) {
                            print('Thank you for sharing my website!');
                          }
                        },
                        child: const Text("Share files")),
                  ],
                ),
              );
            },
            child: const Text("Button 4"))
      ],
    );
  }
}
