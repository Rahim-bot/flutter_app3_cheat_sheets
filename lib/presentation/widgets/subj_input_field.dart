import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/core/themes/global_colors.dart';
import '../../../providers/providers.dart';
import '../../../data/icons_names_list.dart';

class SubjectNameInputField extends ConsumerWidget {
  const SubjectNameInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _controller = TextEditingController();
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
          labelText: 'Subject name',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: topBarIcon!),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: topBarIcon!),
          ),
          floatingLabelStyle: TextStyle(
            color: topBarIcon,
            fontSize: 18,
          ),
          labelStyle: TextStyle(color: topBarIcon)),
      style: TextStyle(color: noteTextColor),
      cursorColor: topBarIcon,
      onChanged: (value) {
        found = 0;
        foundIcons = [];
        for (String x in iconsNames) {
          if (found == 5) break;
          if (value != "" && x.startsWith(value.toLowerCase())) {
            found++;
            foundIcons.add(x.toString());
          }
        }
        ref.read(providedSubjName.notifier).state = value;
        ref.read(foundIconsListProvider.notifier).state = foundIcons;
      },
    );
  }
}
