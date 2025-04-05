import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/top_bar/subject_widget.dart';
import '../../../providers/subject_provider.dart';
import '../../../data/hive_models/subject.dart';
import '../../../core/themes/global_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/top_bar/add_subject.dart';

class SubjectsGrid extends ConsumerWidget {
  const SubjectsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Subject> subjectsList = ref.watch(subjectProvider);
    return Center(
      child: SizedBox(
        width: 500,
        height: 500,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: subjectsList.length + 1,
          itemBuilder: (context, i) {
            if ( i == subjectsList.length) {
              return AddSubject(); // Add subj square is always the last
            }
            return SubjectWidget(
              subjectId: i,
              subjectIcon: SvgPicture.asset(
                "assets/icons/${subjectsList[i].iconName}",
                color: clr,
                height: 80,
                width: 80,
              ),
              subjectTitle: subjectsList[i].name,
            );
          },
        ),
      ),
    );
  }
}
