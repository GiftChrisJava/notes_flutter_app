// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sushi/models/note_model.dart';
import 'package:sushi/widgets/note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(
      {super.key,
      required this.notes,
      required this.index,
      required this.onNoteDeleted});

  final Notes notes;
  final int index;

  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push((MaterialPageRoute(
            builder: (context) => NoteView(
                notes: notes, index: index, onNoteDeleted: onNoteDeleted))));
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notes.title,
                style: const TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                notes.body,
                style: const TextStyle(fontSize: 20),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
