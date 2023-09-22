import 'package:blok_exam/models/note_entity.dart';

class NoteEvent {}

class AddNote extends NoteEvent {
  final NoteItemEntity note;

  AddNote({required this.note});
}
