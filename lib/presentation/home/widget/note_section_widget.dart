import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'note_tile_widget.dart';

class NotesSection extends StatelessWidget {
  const NotesSection({
    Key? key,
    required this.ref,
  }) : super(key: key);

  final Query<Map<String, dynamic>> ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return MasonryGridView.count(
            crossAxisCount: 2,
            itemCount: snapshot.hasData ? snapshot.data?.docs.length : 0,
            itemBuilder: (context, index) {
              return NoteTile(
                ref: ref,
                docToEdit: snapshot.data!.docs[index],
                title: snapshot.data?.docs[index]['title'],
                content: snapshot.data?.docs[index]['content'],
                date: snapshot.data?.docs[index]['date'],
              );
            },
          );
        },
      ),
    );
  }
}
