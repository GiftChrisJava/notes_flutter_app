// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sushi/models/note_model.dart';
import 'package:sushi/screens/create_note.dart';
import 'package:sushi/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Notes> notes = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Notes"),
      ),

      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(
              notes: notes[index], index: index, onNoteDeleted: onNoteDeleted);
        },
      ),

      // create a floating button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  (CreateNote(onNewNoteCreated: onNewNoteCreated))));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void onNewNoteCreated(Notes note) {
    notes.add(note);

    setState(() {});
  }

  void onNoteDeleted(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}
