import 'package:flutter/material.dart';

AuthData users = AuthData({"username": "Just2sire", "password": 12345678});

CurrentUser currentUser =
    CurrentUser({"username": "Just2sire", "password": 12345678});

ButtonType buttonType = ButtonType({
  'team': false,
  'personal': true
});

class ButtonType extends ValueNotifier<Map> {
  ButtonType(Map value) : super({});
}

class AuthData extends ValueNotifier<Map> {
  AuthData(Map value) : super({});
}

class CurrentUser extends ValueNotifier<Map> {
  CurrentUser(Map value) : super({});
}

void main() {
  Map user = {
    "username": "abalo",
    "name": "Amah",
    "age": 20,
  };

  user["age"] = 18;

  User user2 = User(name: "abalo", age: 20, username: "Amah");
  user2.name = "Amah";
}

class User {
  String username;

  String name;

  int age;

  User({required this.username, required this.name, required this.age});

  bool estMineur() => age < 18;
}
