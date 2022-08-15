import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/color/colors.dart';
import 'package:todo/core/constants.dart';

import 'widget/add_note_appbar.dart';

class AddNote extends StatelessWidget {
  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('notes');
  final dateCreated = DateFormat.yMEd().format(DateTime.now());
  final timeCreated = Timestamp.fromDate(DateTime.now());

  AddNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              AddNoteAppBar(
                ref: ref,
                title: title,
                content: content,
                dateCreated: dateCreated,
                timeCreated: timeCreated,
              ),
              TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(color: cGrey, fontSize: 35),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                maxLines: null,
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              kHeight,
              Expanded(
                child: TextField(
                  controller: content,
                  maxLines: null,
                  expands: true,
                  readOnly: false,
                  decoration: InputDecoration(
                    hintText: 'Type Something...',
                    hintStyle: TextStyle(color: cGrey, fontSize: 25),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
