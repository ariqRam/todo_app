import 'package:flutter/material.dart';

import './models/todo.dart';

import './widgets/new_todo.dart';
import './widgets/todo_list.dart';
import './widgets/done_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  __MyHomePageState createState() => __MyHomePageState();
}

class __MyHomePageState extends State<_MyHomePage> {
  List<Todo> _todos = [
    // Todo(
    //   title: "Running",
    //   id: DateTime.now().toString(),
    //   date: DateTime.now(),
    //   icon: Icons.work,
    // ),
    // Todo(
    //   title: "Running2",
    //   id: DateTime.now().toString(),
    //   date: DateTime.now(),
    //   icon: Icons.work,
    // ),
  ];

  int _done = 0;
  double _percentDone = 0;
  void _onCheck(ind) {
    setState(() {
      _todos[ind].checked = !_todos[ind].checked;
      _done = _todos.where((t) => t.checked).length;
      _percentDone = (_done / _todos.length);
    });
    print(_percentDone * 100);
  }

  void _addTodo(String tdTitle, String tdNote, Icon tdIcon, TimeOfDay time) {
    final newTodo = Todo(
      time: time,
      note: tdNote,
      title: tdTitle,
      icon: tdIcon,
      id: DateTime.now().toString(),
    );
    setState(() {
      _todos.add(newTodo);
    });
  }

  void _startAddNewTodo(ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      context: ctx,
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          child: Container(
              height: 400, child: NewTodo(_addTodo, _onCheck, _todos.length)),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoApp"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Icon(
          Icons.add,
          size: 40,
        ),
        onPressed: () {
          _startAddNewTodo(context);
        },
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: double.infinity,
            child: DoneBar(_done, _percentDone),
          ),
          TodoList(_todos, _onCheck),
        ],
      ),
    );
  }
}
