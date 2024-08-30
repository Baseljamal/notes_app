import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_notes_colors_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                Navigator.pop(context);
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              hint: widget.note.title,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: widget.note.subTitle,
              maxLines: 6,
              onChanged: (value) {
                subTitle = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            EditNotesColorsList(
              note: widget.note,
            ),
          ],
        ),
      ),
    );
  }
}