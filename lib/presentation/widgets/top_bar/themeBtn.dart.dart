import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/core/themes/global_colors.dart';
import 'package:progress/providers/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBtn extends ConsumerWidget {
  const ThemeBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        SharedPreferences theme = await SharedPreferences.getInstance();
        String? current = theme.getString("theme");

        if (current == "dark") {
          theme.setString('theme', "light");
          backgroundColor = Color(0xFFEAEAEA);
          topBarBackground = Color(0xFFFFFFFF);
          topBarIcon = Color(0xFF6C757D);
          selectedButtonColor = Color(0xFF1473E6);
          noteBodyColor = topBarBackground;
          noteHeadColor = selectedButtonColor;
          noteTextColor = Colors.black;
          noteOptionsColor = Colors.white;
        } else {
          theme.setString('theme', "dark");
          backgroundColor = Color(0xFF212121);
          topBarBackground = Color(0xFF3C3C3C);
          topBarIcon = Color(0xFF7B7B7B);
          selectedButtonColor = const Color.fromARGB(213, 255, 255, 255);
          noteBodyColor = Color(0xFF0D0D0D);
          noteHeadColor = Color(0xFF2F2F2F);
          noteTextColor = const Color.fromARGB(213, 255, 255, 255);
          noteOptionsColor = topBarIcon;
        }
        ref.read(rebuildProvider.notifier).state++;
      },
      child: Icon(
        Icons.color_lens_outlined,
        color: topBarIcon,
        size: 26,
      ),
    );
  }
}
