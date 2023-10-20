import 'package:flutter/material.dart';
// flutter hive package
import 'package:hive_flutter/hive_flutter.dart';

// home_screen.dart import
import 'package:todo_list_with_storage/screens/home_screen.dart';

void main() async {
  // initialize flutter hive storage
  await Hive.initFlutter();
  var box = await Hive.openBox("localdb");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // remove the default "debug" banner from the top
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
