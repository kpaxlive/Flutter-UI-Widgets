import 'package:flutter/material.dart';
import 'package:task_17/data/user_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  Set<int> segmentValue = {0};
  List<UserData> allUsers = userList;
  List<UserData> filteredUsers = userList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My SearchBar"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.blue.shade50,
                    prefixIconColor: Colors.deepPurple.shade600,
                    filled: true,
                    hintText: "Search someone..",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45))),
                onChanged: (value) {
                  setState(() {
                    _filterTable(value);
                  });
                },
              ),
            ),
            SegmentedButton(
              segments: const <ButtonSegment<int>>[
                ButtonSegment<int>(value: 0, label: Text("Name")),
                ButtonSegment<int>(value: 1, label: Text("Surname")),
              ],
              selected: segmentValue,
              onSelectionChanged: (value) {
                setState(() {
                  segmentValue = value;
                });
              },
            ),
            DataTable(
                columns: const [
                  DataColumn(
                    label: Expanded(child: Text("Name")),
                  ),
                  DataColumn(
                    label: Expanded(child: Text("Surname")),
                  ),
                  DataColumn(
                    label: Expanded(child: Text("Age")),
                  )
                ],
                rows: List.generate(
                    filteredUsers.length,
                    (index) => DataRow(cells: [
                          DataCell(Text(filteredUsers[index].name)),
                          DataCell(Text(filteredUsers[index].surname)),
                          DataCell(Text(filteredUsers[index].age.toString())),
                        ])))
          ],
        ),
      ),
    );
  }

  List<UserData> _filterTable(String value) {
    // Determine whether to filter by Name or Surname based on the selected segment
    String filter = segmentValue.contains(0) ? "Name" : "Surname";

    if (value.isEmpty) {
      // If the search value is empty, display all users
      filteredUsers = allUsers;
    } else {
      // Filter the users based on the selected segment and search value
      filteredUsers = allUsers
          .where((user) => filter == "Name"
              ? user.name.toLowerCase().startsWith(value.toLowerCase())
              : user.surname.toLowerCase().startsWith(value.toLowerCase()))
          .toList();
    }
    return filteredUsers;
  }
}
