import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/core/themes/global_colors.dart';
import 'package:progress/data/hive_models/chapter.dart';
import 'package:progress/providers/chapter_provider.dart';
import 'package:progress/providers/providers.dart';

class AddChapBtn extends ConsumerWidget {
  const AddChapBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        int numOfChaps =
            ref.read(chapterProvider.notifier).getChaptersList().length;
        if (numOfChaps < 10) {
          ref.read(xProvider.notifier).state =
              double.parse((numOfChaps + 1).toString());
          ref.read(chapterProvider.notifier).addChapter(Chapter(number: 1));
          ref.read(chapterProvider.notifier).setActiveChap(numOfChaps);
          ref.read(rebuildNotesGrid.notifier).state++;
        }
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: topBarBackground,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Center(
          child: Icon(
            Icons.add,
            color: topBarIcon,
          ),
        ),
      ),
    );
  }
}
