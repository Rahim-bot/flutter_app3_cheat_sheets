import 'package:hive/hive.dart';
import 'chapter.dart';

part 'subject.g.dart';

@HiveType(typeId: 0)
class Subject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String iconName;

  @HiveField(3)
  List<Chapter> chapters;

  Subject({
    required this.id,
    required this.name,
    required this.iconName,
    this.chapters = const [],
  });
}
