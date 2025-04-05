import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/core/themes/global_colors.dart';
import 'package:progress/providers/chapter_provider.dart';
import 'package:progress/providers/providers.dart';

class ChapBtn extends ConsumerWidget {
  final int chapNum;
  const ChapBtn({super.key, required this.chapNum});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int activeChap = ref.watch(chapterProvider.notifier).activeChapter;
    return InkWell(
      onTap: () {
        ref.read(chapterProvider.notifier).setActiveChap(chapNum - 1);
        ref.read(chapterProvider.notifier).activeChapter = chapNum - 1;
        ref.read(rebuildNotesGrid.notifier).state++;
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: activeChap == chapNum - 1
                ? selectedButtonColor
                : topBarBackground,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Center(
          child: Text(
            chapNum.toString(),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: activeChap == chapNum - 1 ? topBarBackground : topBarIcon,
            ),
          ),
        ),
      ),
    );
  }
}
