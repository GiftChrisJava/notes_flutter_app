// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sushi/models/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key, required this.onNewNoteCreated});

  final Function(Notes) onNewNoteCreated;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  // create 2 txt controllers to capture input.
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextFormField(
            controller: titleController,
            style: TextStyle(fontSize: 28),
            decoration:
                InputDecoration(border: InputBorder.none, hintText: "Title"),
          ),
          SizedBox(height: 10),
          TextField(
            controller: bodyController,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
                border: InputBorder.none, hintText: "Your Strory"),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (titleController.text.isEmpty) {
              return;
            }

            if (bodyController.text.isEmpty) {
              return;
            }

            // create a new note if not empty
            final note =
                Notes(title: titleController.text, body: bodyController.text);

            widget.onNewNoteCreated(note);
            Navigator.of(context).pop();
          },
          child: Icon(Icons.save)),
    );
  }
}
