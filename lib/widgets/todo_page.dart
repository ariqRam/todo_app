import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoPage extends StatefulWidget {
  final Todo todo;
  final Function onCheck;
  final int ind;

  TodoPage(this.todo, this.onCheck, this.ind);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo.title),
        actions: <Widget>[
          Checkbox(
            value: widget.todo.checked,
            onChanged: (_) {
              setState(() {
                widget.onCheck(widget.ind);
              });
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Text(widget.todo.time.toString()),
          Text(widget.todo.note),
        ],
      ),
    );
  }
}
