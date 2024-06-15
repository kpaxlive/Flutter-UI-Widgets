import 'package:flutter/material.dart';
import 'package:task_16/data/user_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TeamData teamDatas = TeamData(userList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade50,
        title: const Text("My DataTable"),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        double paddingValue = orientation == Orientation.landscape
            ? MediaQuery.of(context).size.width * 0.2
            : 0.0;
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingValue),
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                        label: Expanded(
                            child: SizedBox(
                                width: 45, child: Text("Flutter\nTeam")))),
                    DataColumn(label: Expanded(child: Text("IOS\nTeam"))),
                    DataColumn(label: Expanded(child: Text("Android\nTeam"))),
                    DataColumn(label: Expanded(child: Text("Design\nTeam"))),
                  ],
                  rows: List.generate(
                      teamDatas.maxRow,
                      (index) => DataRow(cells: [
                            DataCell(
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/userView',
                                      arguments: teamDatas.flutterData!
                                          .elementAt(index));
                                },
                                child: Text(teamDatas.flutterData!
                                    .elementAt(index)
                                    .name),
                              ),
                            ),
                            DataCell(
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/userView',
                                        arguments: teamDatas.iosData!
                                            .elementAt(index));
                                  },
                                  child: Text(teamDatas.iosData!
                                      .elementAt(index)
                                      .name)),
                            ),
                            DataCell(TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/userView',
                                    arguments: teamDatas.androidData!
                                        .elementAt(index));
                              },
                              child: Text(
                                  teamDatas.androidData!.elementAt(index).name),
                            )),
                            DataCell(TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/userView',
                                    arguments:
                                        teamDatas.designData!.elementAt(index));
                              },
                              child: Text(
                                  teamDatas.designData!.elementAt(index).name),
                            )),
                          ])),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
