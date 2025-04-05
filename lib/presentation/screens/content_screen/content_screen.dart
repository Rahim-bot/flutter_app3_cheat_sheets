import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/presentation/screens/add_note_form/add_note_form.dart';
import 'package:progress/presentation/screens/add_subj_form/add_subj_form.dart';
import 'package:progress/presentation/screens/edit_note_form/edit_note_form.dart';
import 'package:progress/presentation/widgets/add_note.dart';
import 'package:progress/presentation/widgets/notes_grid/notes_grid.dart';
import 'package:progress/presentation/widgets/side_bar/side_bar.dart';
import 'package:progress/providers/providers.dart';
import '../../widgets/top_bar/top_bar.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int addNoteForm = ref.watch(showAddNoteForm);
    int addSbjForm = ref.watch(showAddSbjForm);
    int editNoteForm = ref.watch(showEditNoteForm);
    return Stack(
      children: [
        Column(
          children: [
            TopBar(),
            Expanded(
              child: Row(
                children: [
                  SizedBox(width: 10),
                  SideBar(),
                  SizedBox(width: 10),
                  NotesGrid(),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 100,
            child: Column(
              children: [AddNote()],
            ),
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: addNoteForm == 1 ? AddNoteWidget() : Container()),
        Align(
            alignment: Alignment.center,
            child: addSbjForm == 1 ? AddSubjectForm() : Container()),
        Align(
            alignment: Alignment.center,
            child: editNoteForm == 1 ? EditNoteWidget() : Container()),
      ],
    );
  }
}
