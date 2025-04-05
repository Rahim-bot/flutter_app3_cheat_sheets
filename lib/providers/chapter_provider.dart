import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../data/hive_models/subject.dart';
import 'subject_provider.dart';
import '../data/hive_models/chapter.dart';

final chapterProvider =
    NotifierProvider<ChapterNotifier, List<Chapter>>(() => ChapterNotifier());

class ChapterNotifier extends Notifier<List<Chapter>> {
  int activeChapter = 0;
  List<Subject> subjectsList = [];
  @override
  List<Chapter> build() {
    return [];
  }

  void setActiveChap(int x) {
    activeChapter = x;
  }

  int getActiveChap() {
    return activeChapter;
  }

  List<Chapter> getChaptersList() {
    int activSubj = ref.watch(subjectProvider.notifier).getActiveSubj();
    subjectsList = Hive.box<Subject>('subjectsBox').values.toList();
    if (subjectsList.isEmpty) return [];
    return subjectsList[activSubj].chapters;
  }

  void addChapter(Chapter chapter) {
    Subject targetSubj;
    int activSubj = ref.watch(subjectProvider.notifier).getActiveSubj();
    targetSubj = Hive.box<Subject>('subjectsBox').get(activSubj)!;
    targetSubj.chapters.add(Chapter(number: targetSubj.chapters.length + 1));
    Hive.box<Subject>('subjectsBox').put(activSubj, targetSubj);
    getChaptersList();
  }

  void deleteChapter(int index) {}
}
