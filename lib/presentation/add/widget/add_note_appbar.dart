import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/color/colors.dart';

class AddNoteAppBar extends StatelessWidget {
  const AddNoteAppBar({
    Key? key,
    required this.ref,
    required this.title,
    required this.content,
    required this.dateCreated,
    required this.timeCreated,
  }) : super(key: key);

  final CollectionReference<Object?> ref;
  final TextEditingController title;
  final TextEditingController content;
  final String dateCreated;
  final Timestamp timeCreated;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: cWhite,
              child: Icon(
                Icons.arrow_back,
                color: cBlack,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              ref.add({
                'title': title.text,
                'content': content.text,
                'date': dateCreated,
                'time': timeCreated,
              }).whenComplete(() => Navigator.pop(context));
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: const BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 25,
                    color: cBlack,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
