import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/presentation/widgets/side_bar/add_chap_btn.dart';
import 'package:progress/presentation/widgets/side_bar/chap_btn.dart';
import 'package:progress/providers/chapter_provider.dart';
import 'package:progress/providers/providers.dart';

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(rebuildNotesGrid);
    int numOfChaps =
        ref.read(chapterProvider.notifier).getChaptersList().length;
    return SizedBox(
      width: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          Column(
            spacing: 5,
            children: List.generate(
              numOfChaps,
              (i) => ChapBtn(chapNum: i + 1),
            ),
          ),
          Container(child: numOfChaps < 10 ? AddChapBtn() : Container())
        ],
      ),
    );
  }
}
