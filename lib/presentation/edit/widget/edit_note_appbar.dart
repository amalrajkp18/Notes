import 'package:flutter/material.dart';
import 'package:todo/core/color/colors.dart';
import 'package:todo/core/constants.dart';

class EditNoteAppBar extends StatelessWidget {
  const EditNoteAppBar({
    Key? key,
    required this.title,
    required this.content,
    required this.saveEdit,
    required this.delete,
    required this.edit,
  }) : super(key: key);

  final TextEditingController title;
  final TextEditingController content;
  final VoidCallback saveEdit;
  final VoidCallback delete;

  final Function(bool edit) edit;

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
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  edit(false);
                },
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: cWhite,
                  child: Icon(
                    Icons.mode_edit_outline_outlined,
                    color: cBlack,
                  ),
                ),
              ),
              kWidth,
              GestureDetector(
                onTap: saveEdit,
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: cWhite,
                  child: Icon(
                    Icons.save,
                    color: cBlack,
                  ),
                ),
              ),
              kWidth,
              GestureDetector(
                onTap: delete,
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: cWhite,
                  child: Icon(
                    Icons.delete,
                    color: cBlack,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
