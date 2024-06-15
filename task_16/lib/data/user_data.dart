import 'dart:core';

enum Team
{
  flutterTeam,
  iosTeam,
  androidTeam,
  designTeam,
}

class UserData
{
  String name = '';
  String surname = '';
  Team team = Team.flutterTeam;
  int age = 0;
  String homeTown = '';
  String mail = '';
  
  UserData(this.name, this.surname, this.team, this.age, this.homeTown, this.mail);
}

class TeamData
{
  List<UserData>? allData;
  List<UserData>? flutterData;
  List<UserData>? iosData;
  List<UserData>? androidData;
  List<UserData>? designData;
  int             maxRow = -1;

  TeamData(List<UserData> userList)
  {
    allData = userList;
    flutterData = getData(allData, Team.flutterTeam);
    iosData = getData(allData, Team.iosTeam);
    androidData = getData(allData, Team.androidTeam);
    designData = getData(allData, Team.designTeam);

    if (flutterData!.length > maxRow)
      maxRow = flutterData!.length;
    if (iosData!.length > maxRow)
      maxRow = iosData!.length;
    if (androidData!.length > maxRow)
      maxRow = androidData!.length;
    if (designData!.length > maxRow)
      maxRow = designData!.length;

  }

  List<UserData>? getData(List<UserData>? allData, Team team)
  {
    return allData?.where((user) => user.team == team).toList();
  }
}


List<UserData> userList = [
  UserData(
    "John",
    "Doe",
    Team.flutterTeam,
    30,
    "New York",
    "john.doe@example.com",
  ),
  UserData(
    "Alice",
    "Smith",
    Team.iosTeam,
    25,
    "Los Angeles",
    "alice.smith@example.com",
  ),
  UserData(
    "Michael",
    "Johnson",
    Team.androidTeam,
    35,
    "Chicago",
    "michael.johnson@example.com",
  ),
  UserData(
    "Emily",
    "Brown",
    Team.designTeam,
    28,
    "Houston",
    "emily.brown@example.com",
  ),
  UserData(
    "David",
    "Wilson",
    Team.flutterTeam,
    40,
    "Seattle",
    "david.wilson@example.com",
  ),
  UserData(
    "Sophia",
    "Taylor",
    Team.iosTeam,
    22,
    "Miami",
    "sophia.taylor@example.com",
  ),
  UserData(
    "Christopher",
    "Martinez",
    Team.androidTeam,
    33,
    "Dallas",
    "christopher.martinez@example.com",
  ),
  UserData(
    "Olivia",
    "Garcia",
    Team.designTeam,
    26,
    "San Francisco",
    "olivia.garcia@example.com",
  ),
  UserData(
    "James",
    "Brown",
    Team.flutterTeam,
    32,
    "Boston",
    "james.brown@example.com",
  ),
  UserData(
    "Emma",
    "Anderson",
    Team.iosTeam,
    29,
    "Phoenix",
    "emma.anderson@example.com",
  ),
  UserData(
    "William",
    "Hernandez",
    Team.androidTeam,
    38,
    "Philadelphia",
    "william.hernandez@example.com",
  ),
  UserData(
    "Ava",
    "Young",
    Team.designTeam,
    27,
    "Atlanta",
    "ava.young@example.com",
  ),
  UserData(
    "Daniel",
    "Lopez",
    Team.flutterTeam,
    34,
    "Denver",
    "daniel.lopez@example.com",
  ),
  UserData(
    "Mia",
    "Moore",
    Team.iosTeam,
    24,
    "Detroit",
    "mia.moore@example.com",
  ),
  UserData(
    "Benjamin",
    "Clark",
    Team.androidTeam,
    31,
    "Portland",
    "benjamin.clark@example.com",
  ),
  UserData(
    "Charlotte",
    "Lewis",
    Team.designTeam,
    23,
    "San Diego",
    "charlotte.lewis@example.com",
  ),
];
