import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/themes/global_colors.dart';
import '../../../../providers/providers.dart';

class AddSubject extends ConsumerWidget {
  const AddSubject({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: () => {
              ref.read(showAddSbjForm.notifier).state = 1,
            },
        child: Center(
          child: Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Icon(
              Icons.add,
              color: topBarIcon,
              size: 26,
            ),
          ),
        ));
  }
}
