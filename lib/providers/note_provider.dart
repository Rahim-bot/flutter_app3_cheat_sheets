import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:progress/data/hive_models/subject.dart';
import 'package:progress/providers/chapter_provider.dart';
import 'package:progress/providers/providers.dart';
import '../data/hive_models/chapter.dart';
import 'subject_provider.dart';
import '../data/hive_models/note.dart';
import 'package:flutter/services.dart'; // Import Clipboard API

final noteProvider =
    NotifierProvider<NoteNotifier, List<Note>>(() => NoteNotifier());

class NoteNotifier extends Notifier<List<Note>> {
  List<Note> notesList = [];
  @override
  List<Note> build() {
    return [];
  }

  List<Note> getNotesList() {
    int activSubj = ref.watch(subjectProvider.notifier).getActiveSubj();
    int activCahp = ref.watch(chapterProvider.notifier).getActiveChap();
    List<Subject> subjectsList =
        Hive.box<Subject>('subjectsBox').values.toList();
    if (subjectsList.isEmpty) return [];
    List<Chapter> chaptersList = subjectsList[activSubj].chapters;
    notesList = chaptersList[activCahp].notes;
    return notesList;
  }

  void addNote(Note note) {
    Subject targetSubj;
    int activSubj = ref.watch(subjectProvider.notifier).getActiveSubj();
    int activCahp = ref.watch(chapterProvider.notifier).getActiveChap();
    targetSubj = Hive.box<Subject>('subjectsBox').get(activSubj)!;
    targetSubj.chapters[activCahp].notes.add(note);
    Hive.box<Subject>('subjectsBox').put(activSubj, targetSubj);
    //getChaptersList();
  }

  void editNote(String title, String content) {
    Subject targetSubj;
    int activSubj = ref.watch(subjectProvider.notifier).getActiveSubj();
    int activCahp = ref.watch(chapterProvider.notifier).getActiveChap();
    targetSubj = Hive.box<Subject>('subjectsBox').get(activSubj)!;
    int id = ref.watch(noteToEditId);
    int j = 0;
    for (int i = 0; i < notesList.length; i++) {
      if (notesList[i].id == id) {
        j = i;
        break;
      }
    }
    if (content != "")
      targetSubj.chapters[activCahp].notes[j].content = content;
    if (title != "") targetSubj.chapters[activCahp].notes[j].title = title;
    Hive.box<Subject>('subjectsBox').put(activSubj, targetSubj);
  }

  void deleteNote(int index) {
    Subject targetSubj;
    int activSubj = ref.watch(subjectProvider.notifier).getActiveSubj();
    int activCahp = ref.watch(chapterProvider.notifier).getActiveChap();
    targetSubj = Hive.box<Subject>('subjectsBox').get(activSubj)!;
    targetSubj.chapters[activCahp].notes.removeAt(index);
    Hive.box<Subject>('subjectsBox').put(activSubj, targetSubj);
  }

  void copyNote(int index) {
    Subject targetSubj;
    int activSubj = ref.watch(subjectProvider.notifier).getActiveSubj();
    int activCahp = ref.watch(chapterProvider.notifier).getActiveChap();
    targetSubj = Hive.box<Subject>('subjectsBox').get(activSubj)!;
    String textToCopy=targetSubj.chapters[activCahp].notes[index].content;
    Clipboard.setData(ClipboardData(text: textToCopy)); // Copy text
  }
}
