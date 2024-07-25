// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelAdapter extends TypeAdapter<BookModel> {
  @override
  final int typeId = 0;

  @override
  BookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookModel(
      bookName: fields[0] as String,
      autherName: fields[1] as String,
      numberBooks: fields[2] as String,
      versionNumber: fields[3] as String,
      // firstNumberBook: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookModel obj) {
    writer
          ..writeByte(4)
          ..writeByte(0)
          ..write(obj.bookName)
          ..writeByte(1)
          ..write(obj.autherName)
          ..writeByte(2)
          ..write(obj.numberBooks)
          ..writeByte(3)
          ..write(obj.versionNumber)
        // ..writeByte(4)
        // ..write(obj.firstNumberBook)
        ;
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
