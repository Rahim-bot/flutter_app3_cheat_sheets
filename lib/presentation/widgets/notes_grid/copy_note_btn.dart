import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/core/themes/global_colors.dart';
import 'package:progress/data/hive_models/note.dart';
import 'package:progress/providers/note_provider.dart';
import 'package:progress/providers/providers.dart';

class CopyNoteBtn extends ConsumerWidget {
  final int id;
  const CopyNoteBtn({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(rebuildNotesGrid);
    return InkWell(
      onTap: () {
        List<Note> notesList = ref.watch(noteProvider.notifier).notesList;
        for (int i = 0; i < notesList.length; i++) {
          if (notesList[i].id == id) {
            ref.read(noteProvider.notifier).copyNote(i);
            break;
          }
        }
      },
      child: Icon(
        Icons.copy,
        size: 17,
        color: noteOptionsColor,
      ),
    );
  }
}

