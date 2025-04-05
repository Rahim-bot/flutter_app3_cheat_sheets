import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/presentation/widgets/recommended_icons.dart';
import '../../../../core/themes/global_colors.dart';
import '../../../../providers/providers.dart';

class CancelAddSubjBtn extends ConsumerWidget {
  const CancelAddSubjBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(showAddSbjForm.notifier).state = 0;
        tapped = -1;
        ref.read(foundIconsListProvider.notifier).state = [];
        ref.read(chosenIconNameProvider.notifier).state = "";
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
            "Cancel",
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
