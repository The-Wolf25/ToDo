import 'package:app3/screens/colors.dart';
import 'package:flutter/cupertino.dart';

import '../models/todoo.dart';
import '../screens/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'todo.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final todoslist = Todo.todolist();
  final _todocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 102, 102),
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: Text(
          'Get It Done',
          style: TextStyle(
              fontSize: 26,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(209, 5, 5, 1),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => colors()));
                setState(() {});
              },
              icon: Icon(Icons.color_lens),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 239, 151, 151),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(200, 248, 0, 0)),
                  accountName: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      'Hero',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  accountEmail: Text(''),
                  currentAccountPicture: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 235, 42, 42),
                      child: Icon(
                        Icons.account_circle,
                        size: 60,
                      ))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    size: 20,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15),
                  ),
                  tileColor: Color.fromARGB(255, 229, 90, 90),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.replay_circle_filled,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 20,
                ),
                title: TextButton(
                  style: TextButton.styleFrom(
                    alignment: Alignment.centerLeft,
                  ),
                  child: Text(
                    'Restart',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => home()));
                  },
                ),
                tileColor: Color.fromARGB(255, 229, 90, 90),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: 20,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 30, bottom: 20),
                      child: Text(
                        'Things To get done',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  for (Todo todo in todoslist)
                    todoitem(
                      todo: todo,
                      ondelete: _deletetodo,
                      ontodochange: _handeltodo,
                    ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(bottom: 30, left: 20, right: 10),
                      child: TextField(
                          controller: _todocontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'add a new task',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 56, 103, 27)),
                        onPressed: () {
                          _addtodoitem(_todocontroller.text);
                        },
                        child: Text(
                          '+',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handeltodo(Todo todo) {
    todo.isdone = !todo.isdone;
    setState(() {});
  }

  void _deletetodo(String id) {
    setState(() {});
    todoslist.removeWhere((item) => item.id == id);
  }

  void _addtodoitem(String todo) {
    setState(() {});
    todoslist.add(Todo(
        id: DateTime.now().microsecondsSinceEpoch.toString(), todoText: todo));
    _todocontroller.clear();
  }
}
