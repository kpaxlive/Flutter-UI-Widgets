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
  int age = 0;

  
  UserData(this.name, this.surname, this.age,);
}


List<UserData> userList = [
  UserData(
    "John",
    "Doe",
    30,
  ),
  UserData(
    "Alice",
    "Smith",
    25,
  ),
  UserData(
    "Michael",
    "Johnson",
    35,
  ),
  UserData(
    "Emily",
    "Brown",
    28,
  ),
  UserData(
    "David",
    "Wilson",
    40,
  ),
  UserData(
    "Sophia",
    "Taylor",
    22,
  ),
  UserData(
    "Christopher",
    "Martinez",
    33,
  ),
  UserData(
    "Olivia",
    "Garcia",
    26,
  ),
  UserData(
    "James",
    "Brown",
    32,
  ),
  UserData(
    "Emma",
    "Anderson",
    29,
  ),
  UserData(
    "William",
    "Hernandez",
    38,
  ),
  UserData(
    "Ava",
    "Young",
    27,
  ),
  UserData(
    "Daniel",
    "Lopez",
    34,
  ),
  UserData(
    "Mia",
    "Moore",
    24,
  ),
  UserData(
    "Benjamin",
    "Clark",
    31,
  ),
  UserData(
    "Charlotte",
    "Lewis",
    23,
  ),
];
