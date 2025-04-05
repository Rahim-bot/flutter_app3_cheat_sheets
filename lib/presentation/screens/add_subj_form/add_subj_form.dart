import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/core/themes/global_colors.dart';
import 'package:progress/presentation/widgets/cancelAddSubjBtn.dart';
import '../../widgets/recommended_icons.dart';
import '../../widgets/subj_input_field.dart';
import '../../widgets/add_subj_btn.dart';

class AddSubjectForm extends ConsumerWidget {
  const AddSubjectForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(0, 255, 193, 7),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(50),
            height: 320,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: topBarBackground,
            ),
            child: Column(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SubjectNameInputField(),
                RecommendedIconsRow(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [AddSubjBtn(), CancelAddSubjBtn()],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
