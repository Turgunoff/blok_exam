import 'package:blok_exam/screens/bloc/notes/note_events.dart';
import 'package:blok_exam/screens/bloc/notes/note_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState(notes: [])) {
    on<AddNote>((event, emit) {
      state.notes.add(event.note);
      emit(NoteState(notes: state.notes));
    });
  }
}
