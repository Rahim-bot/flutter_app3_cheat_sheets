import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../core/themes/global_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

int tapped = -1;

class RecommendedIconsRow extends ConsumerWidget {
  const RecommendedIconsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(chosenIconNameProvider);
    List foundIcons = ref.watch(foundIconsListProvider);
    if (foundIcons.isEmpty) {//reset selection color
      tapped = -1;
    }
    return SizedBox(
      height: 60,
      child: Center(
        child: foundIcons.isEmpty
            ? Text(
                "Enter name to select Icon",
                style: TextStyle(color: topBarIcon),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 13,
                children: List.generate(
                  foundIcons.length,
                  (i) => InkWell(
                    onTap: () {
                      tapped = i;
                      ref.read(chosenIconNameProvider.notifier).state =
                          foundIcons[i];
                    },
                    child: SizedBox(
                        width: 55,
                        height: 55,
                        child: SvgPicture.asset(
                          "assets/icons/${foundIcons[i]}",
                          color: tapped == i ? selectedButtonColor : topBarIcon,
                        )),
                  ),
                  //size: 30,
                ),
              ),
      ),
    );
  }
}
