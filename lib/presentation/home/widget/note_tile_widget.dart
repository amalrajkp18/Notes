import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/color/colors.dart';
import 'package:todo/core/constants.dart';
import 'package:todo/presentation/edit/screen_edit_note.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    required this.ref,
    required this.docToEdit,
    required this.title,
    required this.date,
    required this.content,
    Key? key,
  }) : super(key: key);

  final DocumentSnapshot docToEdit;
  final String title;
  final String content;
  final String date;
  final Query ref;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditNote(
                      docToEdit: docToEdit,
                      ref: ref,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: cWhite),
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: cWhite,
                ),
              ),
              kHeight,
              Text(
                content,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 25,
                  color: cGrey,
                ),
              ),
              kHeight,
              Text(
                date,
                style: const TextStyle(
                  fontSize: 15,
                  color: cWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
