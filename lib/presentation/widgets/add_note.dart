import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/core/themes/global_colors.dart';
import 'package:progress/providers/providers.dart';

class AddNote extends ConsumerWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(showAddNoteForm.notifier).state = 1;
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: selectedButtonColor),
        child: Icon(
          Icons.add,
          color: topBarBackground,
        ),
      ),
    );
  }
}
