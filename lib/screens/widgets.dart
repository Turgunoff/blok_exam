import 'package:blok_exam/models/note_entity.dart';
import 'package:blok_exam/screens/bloc/notes/note_bloc.dart';
import 'package:blok_exam/screens/bloc/notes/note_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

showAddingBottomSheets(
  BuildContext context, {
  required NoteBloc noteBloc,
}) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      context: context,
      builder: (context) => BlocProvider.value(
          value: noteBloc, child: const NoteAddBottomSheet()));
}

class NoteAddBottomSheet extends StatefulWidget {
  const NoteAddBottomSheet({super.key});

  @override
  State<NoteAddBottomSheet> createState() => _NoteAddBottomSheetState();
}

class _NoteAddBottomSheetState extends State<NoteAddBottomSheet> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: Column(
            children: [
              SizedBox(
                height: 48,
                child: TextField(
                  controller: _controller,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_controller.text.length > 5) {
                          context.read<NoteBloc>().add(AddNote(
                              note: NoteItemEntity(
                                  text: _controller.text,
                                  date: DateTime.now().toString())));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        "Qo'shish",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ))
                ],
              )
            ],
          ),
        ),
      );
}
