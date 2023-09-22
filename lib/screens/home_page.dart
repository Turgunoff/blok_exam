import 'package:blok_exam/screens/bloc/notes/note_bloc.dart';
import 'package:blok_exam/screens/bloc/notes/note_state.dart';
import 'package:blok_exam/screens/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NoteBloc noteBloc;

  @override
  void initState() {
    noteBloc = NoteBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: noteBloc,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'Block',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
          ),
          body: BlocBuilder<NoteBloc, NoteState>(
            builder: (context, state) {
              return ListView.builder(
                itemBuilder: (context, index) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.notes[index].text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        Jiffy.parse(state.notes[index].date)
                            .format(pattern: 'dd.MM.yyyy'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: state.notes.length,
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                showAddingBottomSheets(context, noteBloc: noteBloc);
              }),
        ),
      );
}
