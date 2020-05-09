import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Todo {
  final TimeOfDay time;
  final String title;
  final String id;
  final String note;
  bool checked;
  Icon icon;

  Todo({
    @required this.time,
    @required this.title,
    @required this.id,
    this.note,
    this.checked = true,
    this.icon,
  });
}

