import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/color/colors.dart';

import 'widget/edit_note_appbar.dart';

class EditNote extends StatefulWidget {
  final DocumentSnapshot docToEdit;
  final Query ref;
  const EditNote({Key? key, required this.docToEdit, required this.ref})
      : super(key: key);

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  bool edit = true;

  @override
  void initState() {
    title = TextEditingController(text: widget.docToEdit['title']);
    content = TextEditingController(text: widget.docToEdit['content']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              EditNoteAppBar(
                edit: (value) {
                  setState(() {
                    edit = value;
                  });
                },
                saveEdit: () {
                  widget.docToEdit.reference.update(
                    {
                      'title': title.text,
                      'content': content.text,
                    },
                  ).whenComplete(() => Navigator.pop(context));
                },
                delete: () {
                  widget.docToEdit.reference
                      .delete()
                      .whenComplete(() => Navigator.pop(context));
                },
                title: title,
                content: content,
              ),
              TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(color: cGrey, fontSize: 35),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
                maxLines: null,
                readOnly: edit,
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TextField(
                  controller: content,
                  maxLines: null,
                  expands: true,
                  readOnly: edit,
                  decoration: InputDecoration(
                    hintText: 'Type Something...',
                    hintStyle: TextStyle(color: cGrey, fontSize: 25),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
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
