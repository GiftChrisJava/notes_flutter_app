// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sushi/models/note_model.dart';

class NoteView extends StatelessWidget {
  const NoteView(
      {super.key,
      required this.notes,
      required this.index,
      required this.onNoteDeleted});

  final Notes notes;
  final int index;

  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note View"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Delete This ?"),
                        content: Text("Note ${notes.title} will be deleted!"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                onNoteDeleted(index);
                                Navigator.of(context).pop();
                              },
                              child: Text("DELETE")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("CANCEL")),
                        ],
                      );
                    });
              },
              icon: Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            notes.title,
            style: TextStyle(
                fontSize: 26, color: const Color.fromARGB(255, 203, 156, 14)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            notes.body,
            style: TextStyle(fontSize: 16),
          )
        ]),
      ),
    );
  }
}
