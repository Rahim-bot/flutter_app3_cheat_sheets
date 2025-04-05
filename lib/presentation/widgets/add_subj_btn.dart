import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../data/hive_models/subject.dart';
import '../../../core/themes/global_colors.dart';
import '../../data/hive_models/chapter.dart';

class AddSubjBtn extends ConsumerWidget {
  const AddSubjBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int subjectWidgetId = ref.watch(subjectProvider).length;
    return InkWell(
      onTap: () {
        ref.read(showAddSbjForm.notifier).state = 0;
        String chosenIcon = ref.watch(chosenIconNameProvider.notifier).state;
        if (chosenIcon != "") {
          List<Subject> subjs = ref.watch(subjectProvider);
          bool exist = false;
          for (int i = 0; i < subjs.length; i++) {
            if (subjs[i].iconName == chosenIcon) exist = true;
          }
          if (!exist) {
            String userInput = ref.watch(providedSubjName.notifier).state;
            ref.read(subjectProvider.notifier).addSubject(
                  Subject(
                      id: subjectWidgetId,
                      name: userInput,
                      iconName: chosenIcon,
                      chapters: [Chapter(number: 1)]),
                );
            ref.read(subjectProvider.notifier).setActiveSubj(subjectWidgetId);
          }
        }
        ref.read(chosenIconNameProvider.notifier).state = "";
        ref.read(foundIconsListProvider.notifier).state = [];
      },
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: selectedButtonColor,
        ),
        child: Center(
          child: Text(
            "Add",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: topBarBackground,
            ),
          ),
        ),
      ),
    );
  }
}
