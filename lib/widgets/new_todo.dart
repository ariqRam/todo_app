import 'package:flutter/material.dart';

import 'package:flutter_iconpicker/Models/IconPack.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:todo_app/widgets/color_picker.dart';

import './color_picker.dart';

class NewTodo extends StatefulWidget {
  final Function _addHandler;
  final Function _onCheck;
  final int ind;

  NewTodo(this._addHandler, this._onCheck, this.ind);

  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  Color currentColor = Colors.blue;
  IconData pickedIcon;
  TimeOfDay time = TimeOfDay.now();

  void changeColor(Color color) => setState(() => currentColor = color);

  void submitForm() {
    final enteredTitle = titleController.text;
    final enteredNote = noteController.text;

    widget._addHandler(
      enteredTitle,
      enteredNote,
      Icon(
        pickedIcon ?? Icons.work,
        color: currentColor,
      ),
      time,
    );
    widget._onCheck(widget.ind);
    Navigator.of(context).pop();
  }

  Future<Null> selectTime(BuildContext context) async {
    TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: time,
    );

    setState(() {
      time = picked;
    });
  }

  pickIcon() async {
    IconData icon = await FlutterIconPicker.showIconPicker(
      context,
      iconPackMode: IconPack.material,
      iconPickerShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );

    pickedIcon = icon ?? Icons.work;
    setState(() {});

    debugPrint('Picked Icon:  $icon');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: "Title"),
                ),
                IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () {
                    selectTime(context);
                  },
                )
              ],
            ),
            TextField(
              controller: noteController,
              decoration: InputDecoration(labelText: "Note"),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                CustomColorPicker(currentColor, changeColor),
                IconButton(
                  icon: Icon(pickedIcon ?? Icons.work),
                  color: currentColor,
                  onPressed: pickIcon,
                ),
              ],
            ),
            FlatButton(
              onPressed: submitForm,
              child: Text("Add Todo"),
            ),
          ],
        ),
      ),
    );
  }
}
