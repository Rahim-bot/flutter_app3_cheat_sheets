import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/core/themes/global_colors.dart';
import 'package:progress/providers/providers.dart';

class EditNoteBtn extends ConsumerWidget {
  final int id;
  const EditNoteBtn({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(rebuildNotesGrid);
    return InkWell(
      onTap: () {
        ref.read(noteToEditId.notifier).state = id;
        ref.read(showEditNoteForm.notifier).state = 1;
      },
      child: Icon(
        Icons.edit,
        size: 17,
        color: noteOptionsColor,
      ),
    );
  }
}
