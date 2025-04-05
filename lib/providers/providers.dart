import 'package:flutter_riverpod/flutter_riverpod.dart';
export 'subject_provider.dart';

final screenProvider = StateProvider<String>((ref) {
  return 'subjects_screen';
});

final xProvider = StateProvider<double>((ref) {
  return 1;
});

final notesListProvider = StateProvider<List>((ref) {
  return [];
});

final foundIconsListProvider = StateProvider<List<String>>((ref) {
  return [];
});

final providedSubjName = StateProvider<String>((ref) {
  return "";
});

final chosenIconNameProvider = StateProvider<String>((ref) {
  return "";
});

final rebuildProvider = StateProvider<int>((ref) {
  return 1;
});

final noteTitleProvider = StateProvider<String>((ref) {
  return "";
});

final noteBodyrovider = StateProvider<String>((ref) {
  return "";
});

final rebuildNotesGrid = StateProvider<int>((ref) {
  return 1;
});

final showAddNoteForm = StateProvider<int>((ref) {
  return 0;
});

final showAddSbjForm = StateProvider<int>((ref) {
  return 0;
});

final themeProvider = StateProvider<int>((ref) {
  return 0;
});

final showEditNoteForm = StateProvider<int>((ref) {
  return 0;
});
final noteToEditId = StateProvider<int>((ref) {
  return 0;
});