import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/core/themes/global_colors.dart';
import 'package:progress/data/hive_models/note.dart';
import 'package:progress/providers/note_provider.dart';
import 'package:progress/providers/providers.dart';

class EditNoteWidget extends ConsumerWidget {
  const EditNoteWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(0, 255, 193, 7),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(40),
            height: 420,
            width: 550,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: topBarBackground,
            ),
            child: Column(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NoteTitleInputField(),
                NoteBodyInputField(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [SaveBtn(), CancelBtn()],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoteTitleInputField extends ConsumerWidget {
  const NoteTitleInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Note> notesList = ref.watch(noteProvider.notifier).notesList;
    int j = 0;
    final id = ref.watch(noteToEditId);
    for (int i = 0; i < notesList.length; i++) {
      if (notesList[i].id == id) j = i;
    }
    final old = notesList[j].title;
    final TextEditingController _controller = TextEditingController(text: old);
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Note Title',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: topBarIcon!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: topBarIcon!),
        ),
        floatingLabelStyle: TextStyle(
          color: topBarIcon,
          fontSize: 18,
        ),
        labelStyle: TextStyle(color: topBarIcon),
      ),
      style: TextStyle(color: noteTextColor),
      cursorColor: topBarIcon,
      onChanged: (value) {
        ref.read(noteTitleProvider.notifier).state = value;
      },
    );
  }
}

class NoteBodyInputField extends ConsumerWidget {
  const NoteBodyInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Note> notesList = ref.watch(noteProvider.notifier).notesList;
    int j = 0;
    int id = ref.watch(noteToEditId);
    for (int i = 0; i < notesList.length; i++) {
      if (notesList[i].id == id) {
        j = i;
        break;
      }
      ;
    }
    String old = notesList[j].content;
    TextEditingController _controller = TextEditingController(text: old);
    return SizedBox(
      height: 170,
      child: TextField(
        maxLines: null,
        minLines: null,
        expands: true,
        controller: _controller,
        decoration: InputDecoration(
            labelText: 'Note Content',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: topBarIcon!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: topBarIcon!),
            ),
            floatingLabelStyle: TextStyle(
              color: topBarIcon,
              fontSize: 18,
            ),
            labelStyle: TextStyle(color: topBarIcon)),
        style: TextStyle(color: noteTextColor),
        cursorColor: topBarIcon,
        onChanged: (value) {
          ref.read(noteBodyrovider.notifier).state = value;
        },
      ),
    );
  }
}

class SaveBtn extends ConsumerWidget {
  const SaveBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        String title = ref.watch(noteTitleProvider);
        String code = ref.watch(noteBodyrovider);
        ref.read(noteBodyrovider.notifier).state = "";
        ref.read(noteTitleProvider.notifier).state = "";
        ref.read(showEditNoteForm.notifier).state = 0;
        ref.read(noteProvider.notifier).editNote(title, code);
      },
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: selectedButtonColor,
        ),
        child: Center(
          child: Text(
            "Save",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: topBarBackground,
            ),
          ),
        ),
      ),
    );
  }
}

class CancelBtn extends ConsumerWidget {
  const CancelBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(noteBodyrovider.notifier).state = "";
        ref.read(noteTitleProvider.notifier).state = "";
        ref.read(showEditNoteForm.notifier).state = 0;
      },
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: selectedButtonColor,
        ),
        child: Center(
          child: Text(
            "Cancel",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: topBarBackground,
            ),
          ),
        ),
      ),
    );
  }
}
