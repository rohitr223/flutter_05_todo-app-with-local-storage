import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  // todo task
  final String task;
  // is the task completed or not (true/false)
  final bool isCompleted;
  // checkbox onChanged function
  Function(bool?)? onChanged;
  // detete todo function
  Function(BuildContext)? deleteTodo;

  TodoTile({
    super.key,
    required this.task,
    required this.isCompleted,
    required this.onChanged,
    required this.deleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTodo,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: Container(
          // adding internal padding
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          // adding external margin
          
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // adding shadow effect using boxShadow
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 220, 218, 218),
                blurRadius: 1.0,
                spreadRadius: 3.0,
              ),
            ],
          ),
          child: Row(
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: onChanged,
                activeColor: const Color.fromARGB(255, 51, 126, 53),
              ),
              Text(
                task,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
