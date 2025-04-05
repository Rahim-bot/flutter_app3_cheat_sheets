import 'package:flutter/material.dart';
import '../../../data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';

class SubjectWidget extends ConsumerWidget {
  final int subjectId;
  final Widget subjectIcon;
  final String subjectTitle;
  const SubjectWidget({
    super.key,
    this.subjectTitle = "",
    required this.subjectIcon,
    required this.subjectId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => {
        ref.read(screenProvider.notifier).state = "subj_content",
        ref.read(subjectProvider.notifier).setActiveSubj(subjectId),
        ref.read(xProvider.notifier).state = 1, //select animation reset
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.cyan,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 100, width: 100, child: Center(child: subjectIcon)),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                subjectTitle,
                style: TextStyle(
                    color: clr, fontWeight: FontWeight.w600, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
