import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/core/themes/global_colors.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:progress/presentation/widgets/notes_grid/copy_note_btn.dart';
import 'package:progress/presentation/widgets/notes_grid/delete_note_btn.dart';
import 'package:progress/presentation/widgets/notes_grid/edit_note_btn.dart';

class NoteWidget extends ConsumerWidget {
  final int id;
  final String code;
  final String title;
  const NoteWidget(
      {super.key, required this.id, required this.code, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            color: noteHeadColor,
          ),
          height: 30,
          width: double.infinity,
          child: Row(
            spacing: 5,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: noteTitleColor,
                    ),
                  ),
                ),
              ),
              EditNoteBtn(
                id: id,
              ),
              DeleteNoteBtn(
                id: id,
              ),
              CopyNoteBtn(
                id: id,
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          /*child: CodeField(
            controller: _controller, // Link the controller
            textStyle: TextStyle(fontSize: 14),
            lineNumberStyle: LineNumberStyle(
                // Set the color to transparent to hide line numbers

                ),
            //enableInteractiveSelection: true,
            //readOnly: true,
            //showLineNumbers: false,
            decoration: BoxDecoration(
              color: Colors.black, // Set the background color here
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight:
                      Radius.circular(5)), // Optional: Add rounded corners
            ),
          ),*/
          child: HighlightView(
            code,
            language: 'dart',
            theme: {
              ...vs2015Theme,
              'root': TextStyle(
                  color: noteTextColor,
                  backgroundColor: noteBodyColor), // Change text color
            },
            padding: EdgeInsets.all(8),
            textStyle: TextStyle(fontSize: 14),
          ),
        )
      ],
    );
  }
}
