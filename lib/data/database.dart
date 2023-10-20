// flutter hive package
import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  // hove local db
  final _myBox = Hive.box("localdb");

  // initializing an empty list
  List todoList = [];

  // run this function when the app is downloaded by the user
  void newUserData() {
    todoList = [
      ["Buy Groceries", true],
      ["Exercise", false],
    ];
  }

  // load the data from the local database
  void loadUserData() {
    todoList = _myBox.get("TODOLIST");
  }

  // update the database when user adds/deletes the todos
  void updateUserData() {
    _myBox.put("TODOLIST", todoList);
  }

}
