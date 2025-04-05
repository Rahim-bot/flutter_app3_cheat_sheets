import 'package:hive/hive.dart';

part 'note.g.dart'; 
@HiveType(typeId: 2)
class Note {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String content;

  Note({required this.id ,required this.title, required this.content});
}
