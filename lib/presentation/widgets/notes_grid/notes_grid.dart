import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:progress/presentation/widgets/notes_grid/note_widget.dart';
import 'package:progress/providers/note_provider.dart';
import 'package:progress/providers/providers.dart';

class NotesGrid extends ConsumerWidget {
  const NotesGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(rebuildNotesGrid);
    List notesList = ref.watch(noteProvider.notifier).getNotesList();
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        int wid = constraints.maxWidth > 900
            ? 3
            : constraints.maxWidth > 550
                ? 2
                : 1;
        return Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: MasonryGridView.count(
            crossAxisCount: wid,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: notesList.length,
            itemBuilder: (context, i) {
              return NoteWidget(
                id:notesList[i].id,
                title: notesList[i].title,
                code: notesList[i].content,
              );
            },
          ),
        );
      }),
    );
  }
}
