import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/todoo.dart';
import 'package:test_api/hooks.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'homescreen.dart';

class todoitem extends StatelessWidget {
  final Todo todo;
  final ontodochange;
  final ondelete;
  const todoitem(
      {Key? key,
      required this.todo,
      required this.ontodochange,
      required this.ondelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListTile(
          onTap: () {
            ontodochange(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              todo.isdone ? Icons.check_box : Icons.check_box_outline_blank,
              color: Color.fromARGB(255, 39, 128, 12),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          tileColor: Color.fromARGB(255, 244, 223, 223),
          title: Text(
            todo.todoText!,
            style: TextStyle(
                decoration: todo.isdone ? TextDecoration.lineThrough : null),
          ),
          trailing: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 0, 0),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: (() {
                ondelete(todo.id);
              }),
              icon: Icon(Icons.delete),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

    SizedBox(
      height: 100,
    );
  }
}
