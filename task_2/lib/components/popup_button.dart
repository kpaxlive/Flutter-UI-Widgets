import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/material.dart';

class PopupButton extends StatefulWidget {
  const PopupButton({super.key});

  @override
  State<PopupButton> createState() => _PopupButtonState();
}

class _PopupButtonState extends State<PopupButton> {
  bool showNotification = false;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showNotification)
          ElegantNotification.success(
            width: MediaQuery.of(context).size.width,
            animation: AnimationType.fromRight,
            position: Alignment.topRight,
            description: const Text("Your Code is 'NeonAcademy'"),
            stackedOptions: StackedOptions(
                    key: 'top',
                    type: StackedType.same,
                    itemOffset: Offset(-5, -5),
                  ),
            onProgressFinished: () {
              setState(() {
                showNotification = false;
              });
      
            },
          ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
              value: "Snackbar",
              child: Text("Show SnackBar"),
            ),
            const PopupMenuItem(
                value: "notification",
                child: Text("Show Notification")), 
          ],
          onSelected: (value) {
            switch (value) {
              case "Snackbar":
                const snack = SnackBar(
                  content: Text("Popup menu worked!"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snack);
                break;
              case "notification":
                setState(() {
                  showNotification = true;
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                });
                break;
              default:
            }
          },
        ),
      ]
    );
      }
}