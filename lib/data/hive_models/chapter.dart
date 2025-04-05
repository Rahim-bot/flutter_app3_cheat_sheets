import 'package:hive/hive.dart';
import 'note.dart';

part 'chapter.g.dart'; 
@HiveType(typeId: 1)
class Chapter {
  @HiveField(0)
  int number;

  @HiveField(1)
  List<Note> notes=[];

  Chapter({required this.number});
}
