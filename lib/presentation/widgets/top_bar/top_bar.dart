import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progress/core/themes/global_colors.dart';
import 'package:progress/data/hive_models/subject.dart';
import 'package:progress/presentation/widgets/top_bar/add_subject.dart';
import 'package:progress/presentation/widgets/top_bar/grid_type_btn.dart';
import 'package:progress/presentation/widgets/top_bar/subjIcon.dart';
import 'package:progress/presentation/widgets/top_bar/themeBtn.dart.dart';
import 'package:progress/providers/providers.dart';

class TopBar extends ConsumerWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(rebuildNotesGrid);
    List<Subject> subjectsList = ref.watch(subjectProvider);
    int activeChapID = ref.watch(subjectProvider.notifier).activeSubject;
    return Container(
      color: topBarBackground,
      height: 35,
      child: Row(
        children: [
          Container(width: 10),
          InkWell(
            child: Icon(
              Icons.home_rounded,
              size: 26,
              color: topBarIcon,
            ),
            onTap: () {},
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Expanded(child: Container()),
                AddSubject(),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 15,
                      children: List.generate(
                        subjectsList.length,
                        (i) => SubjIcon(
                          subjectId: i,
                          subjectIcon: SvgPicture.asset(
                            "assets/icons/${subjectsList[i].iconName}",
                            // ignore: deprecated_member_use
                            color: activeChapID != i
                                ? topBarIcon
                                : selectedButtonColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container())
              ],
            ),
          ),
          Row(
            spacing: 15,
            children: [ThemeBtn(), GridTypeBtn()],
          ),
          Container(width: 10)
        ],
      ),
    );
  }
}
