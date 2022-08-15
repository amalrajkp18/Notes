import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/color/colors.dart';
import '../add/screen_add_note.dart';
import 'widget/note_section_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ref = FirebaseFirestore.instance
      .collection("notes")
      .orderBy("time", descending: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: cWhite,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNote(),
            ),
          );
        },
        label: const Text(
          'Add Note',
          style: TextStyle(color: cBlack),
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Your Notes',
              style: TextStyle(
                color: cWhite,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.carterOne().fontFamily,
              ),
            ),
          ),
          Expanded(
            child: NotesSection(ref: ref),
          )
        ],
      )),
    );
  }
}
