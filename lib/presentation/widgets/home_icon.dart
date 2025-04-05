import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';

class HomeIcon extends ConsumerWidget {
  const HomeIcon({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return InkWell(
      onTap: () => {
        ref.read(screenProvider.notifier).state = "subjects_screen"
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.cyan,
        ),
        child: Icon(Icons.home),
      ),
    );
  }
}