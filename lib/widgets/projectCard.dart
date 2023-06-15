import 'package:flutter/material.dart';
import 'package:local_database/models/project_model.dart';

class ProjectCard extends StatelessWidget {
  final Project note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const ProjectCard(
      {Key? key,
      required this.note,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        print('clicked');
      },
      icon: const Icon(Icons.circle, color: Colors.cyan),
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(note.title),
          const Row(
            children: [Icon(Icons.edit), Icon(Icons.navigate_next)],
          )
        ],
      ),
      style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(30),
          foregroundColor: Colors.black),
    );
  }
}
