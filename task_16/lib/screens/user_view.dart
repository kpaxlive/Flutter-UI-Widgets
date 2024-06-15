import 'package:flutter/material.dart';
import 'package:task_16/data/user_data.dart';


class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserData;
    return Scaffold(
      appBar: AppBar(
        title: const Text("UserView"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FixedColumnWidth(120.0),
              },
              children: [
                TableRow(
                  children: [
                    const TableCell(
                        child: Text("Name", textAlign: TextAlign.center)),
                    TableCell(
                        child: Text(args.name.toString(),
                            textAlign: TextAlign.center)),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                        child: Text("Surname", textAlign: TextAlign.center)),
                    TableCell(
                        child: Text(args.surname.toString(),
                            textAlign: TextAlign.center)),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                        child: Text("Team", textAlign: TextAlign.center)),
                    TableCell(
                        child: Text(args.team.toString(),
                            textAlign: TextAlign.center)),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                        child: Text("Age", textAlign: TextAlign.center)),
                    TableCell(
                        child: Text(args.age.toString(),
                            textAlign: TextAlign.center)),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                        child: Text("Hometown", textAlign: TextAlign.center)),
                    TableCell(
                        child: Text(args.homeTown.toString(),
                            textAlign: TextAlign.center)),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                        child: Text("Mail", textAlign: TextAlign.center)),
                    TableCell(
                        child: Text(args.mail.toString(),
                            textAlign: TextAlign.center)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
