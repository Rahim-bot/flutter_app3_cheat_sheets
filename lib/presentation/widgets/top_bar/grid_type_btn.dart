import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/core/themes/global_colors.dart';

class GridTypeBtn extends ConsumerWidget {
  const GridTypeBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {},
      child: Icon(
        Icons.settings,
        size: 26,
        color: topBarIcon,
      ),
    );
  }
}
