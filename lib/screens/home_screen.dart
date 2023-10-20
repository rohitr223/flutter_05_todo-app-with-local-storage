import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_with_storage/data/database.dart';

import 'package:todo_list_with_storage/utils/dialog_box.dart';
import 'package:todo_list_with_storage/utils/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // localdb database (flutter hive)
  final _myBox = Hive.box("localdb");

  // instance of the class TodoDatabase i.e. imported from data/database.dart
  TodoDatabase db = TodoDatabase();

  // textfield input controller function
  final _controller = TextEditingController();

  // when the app is loaded first time for new user
  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.newUserData();
    } else {
      // if the user has already started using the app
      db.loadUserData();
    }

    super.initState();
  }

  // to set the check box value
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateUserData();
  }

  // save an newly created todo task
  void saveNewTodo() {
    setState(() {
      // default value will be false for newly added todos
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    // close the dialog box when a new task is added
    Navigator.of(context).pop();
    db.updateUserData();
  }

  // create a new todo
  void createNewTodo() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          // save new Todo
          onSave: saveNewTodo,
          // close the dialog-box
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete todo
  void deleteOldTodo(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos App"),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTodo,
        backgroundColor: Colors.deepPurple,
        elevation: 0, // no shadow effect
        child: const Icon(Icons.add),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            // TodoTile component
            return TodoTile(
              task: db.todoList[index][0],
              isCompleted: db.todoList[index][1],
              onChanged: (value) {
                checkBoxChanged(value, index);
              },
              deleteTodo: (context) {
                // delete todo using index
                deleteOldTodo(index);
              },
            );
          },
        ),
      ),
    );
  }
}
