import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/providers/chapter_provider.dart';
import 'package:progress/providers/providers.dart';

class SubjIcon extends ConsumerWidget {
  final int subjectId;
  final Widget subjectIcon;
  const SubjIcon({
    super.key,
    required this.subjectIcon,
    required this.subjectId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: () {
          ref.read(subjectProvider.notifier).setActiveSubj(subjectId);
          ref.read(rebuildNotesGrid.notifier).state++;
          ref.read(chapterProvider.notifier).setActiveChap(0);
        },
        child: SizedBox(width: 26, height: 26, child: subjectIcon));
  }
}
