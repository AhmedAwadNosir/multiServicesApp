import 'package:flutter/foundation.dart';

class NoteModal {
  String title;
  String description;
  final String date;
  int? noteColor;

  NoteModal({
    required this.title,
    required this.description,
    required this.date,
    @required this.noteColor,
  });
}
