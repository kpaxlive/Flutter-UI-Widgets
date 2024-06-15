
import 'package:flutter/material.dart';


class ProfileInfo extends ChangeNotifier {
  String? name;
  int? age;
  String? image;
  Color? color;
  String? font;

  ProfileInfo({this.name, this.age, this.image});

  void setName(String? name)
  {
    this.name = name;
    notifyListeners();
  }

  void setAge(int? _age)
  {
    age = _age;
    notifyListeners();
  }

  void setImage(String? _image)
  {
    image = _image;
    notifyListeners();
  }

  void setColor(Color _color)
  {
    color = _color;
    notifyListeners();
  }

  void setFont(String? _font)
  {
    font = _font;
    notifyListeners();
  }
}