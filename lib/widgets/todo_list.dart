import 'package:flutter/material.dart';

import './todo_page.dart';

import '../models/todo.dart';

class TodoList extends StatefulWidget {
  final List<Todo> todos;
  final Function onCheckGlobal;

  TodoList(this.todos, this.onCheckGlobal);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> get rearrangedTodo {
    widget.todos.sort((a, b) => a.time.hour.toDouble().compareTo(b.time.hour.toDouble()));
    List list = List<Todo>.from(widget.todos);
    return list;
  }

  void onCheck(ind) {
    setState(() {
      widget.onCheckGlobal(ind);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      child: ListView.builder(
        itemCount: rearrangedTodo.length,
        itemBuilder: (ctx, ind) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoPage(
                      rearrangedTodo[ind],
                      widget.onCheckGlobal,
                      ind,
                    ),
                  ),
                );
              },
              trailing: Checkbox(
                value: rearrangedTodo[ind].checked,
                onChanged: (_) {
                  onCheck(ind);
                },
              ),
              leading: Padding(
                padding: EdgeInsets.only(top: 5),
                child: rearrangedTodo[ind].icon,
              ),
              title: Text(
                rearrangedTodo[ind].title,
                style: TextStyle(
                    decoration: (rearrangedTodo[ind].checked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
                    color: rearrangedTodo[ind].checked
                        ? Colors.grey
                        : Colors.indigo),
              ),
              subtitle: Text(rearrangedTodo[ind].time.format(context)),
            ),
          );
        },
      ),
    );
  }
}
