import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../data/hive_models/subject.dart';

final subjectProvider =
    NotifierProvider<SubjectNotifier, List<Subject>>(() => SubjectNotifier());

class SubjectNotifier extends Notifier<List<Subject>> {
  @override
  List<Subject> build() {
    if (Hive.box<Subject>('subjectsBox').isNotEmpty) {
      return Hive.box<Subject>('subjectsBox').values.toList();
    }
    return [];
  }

  int activeSubject = 0;
  void setActiveSubj(int x) {
    activeSubject = x;
  }

  int getActiveSubj() {
    return activeSubject;
  }

  void addSubject(Subject subject) {
    Hive.box<Subject>('subjectsBox').add(subject);
    state = Hive.box<Subject>('subjectsBox').values.toList();
  }

  void deleteSubject(int index) {}
}
