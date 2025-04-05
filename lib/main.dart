import 'package:flutter/material.dart';
import 'package:progress/core/themes/global_colors.dart';
import 'package:progress/presentation/screens/add_note_form/add_note_form.dart';
import 'package:progress/presentation/screens/content_screen/content_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/providers.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:progress/presentation/screens/add_subj_form/add_subj_form.dart';
import 'data/hive_models/models_barrel.dart';

void main() async {
  //await Hive.deleteFromDisk(); // Clears all stored data

  await Hive.initFlutter();
  Hive.registerAdapter(SubjectAdapter());
  Hive.registerAdapter(ChapterAdapter());
  Hive.registerAdapter(NoteAdapter());

  await Hive.deleteBoxFromDisk('subjectsBox');
  await Hive.openBox<Subject>('subjectsBox');

  SharedPreferences theme = await SharedPreferences.getInstance();
  String? current = theme.getString("theme");

  if (current == "light" || current == null) {
    backgroundColor = Color(0xFFEAEAEA);
    topBarBackground = Color(0xFFFFFFFF);
    topBarIcon = Color(0xFF6C757D);
    selectedButtonColor = Color(0xFF1473E6);
    noteBodyColor = topBarBackground;
    noteHeadColor = selectedButtonColor;
    noteTextColor = Colors.black;
    noteTitleColor = Colors.white;
    noteOptionsColor = Colors.white;
  } else {
    backgroundColor = Color(0xFF212121);
    topBarBackground = Color(0xFF3C3C3C);
    topBarIcon = Color(0xFF7B7B7B);
    selectedButtonColor = const Color.fromARGB(213, 255, 255, 255);
    noteBodyColor = Color(0xFF0D0D0D);
    noteHeadColor = Color(0xFF2F2F2F);
    noteTextColor = const Color.fromARGB(213, 255, 255, 255);
    noteTitleColor = Colors.white;
    noteOptionsColor = topBarIcon;
  }

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screen = ref.watch(screenProvider);
    ref.watch(rebuildProvider);
    bool zeroSubj = ref.watch(subjectProvider).isEmpty;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: zeroSubj
            ? AddSubjectForm()
            : screen == "subjects_screen"
                ? MainScreen() //SubjectsGrid()
                /*InkWell(
              onTap: () async{
                await Hive.deleteFromDisk();
              },
              child: Container(width: 100,height: 100,color: Colors.red,),
            )*/
                : screen == "add_subj_form"
                    ? AddSubjectForm()
                    : AddNoteWidget(),
      ),
    );
  }
}
