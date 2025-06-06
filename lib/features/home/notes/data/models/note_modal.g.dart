// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteModalAdapter extends TypeAdapter<NoteModal> {
  @override
  final int typeId = 0;

  @override
  NoteModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteModal(
      title: fields[0] as String,
      description: fields[1] as String,
      date: fields[2] as String,
      noteColor: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, NoteModal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.noteColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
