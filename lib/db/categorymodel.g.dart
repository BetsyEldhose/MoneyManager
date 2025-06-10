// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorymodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class categoryAdapter extends TypeAdapter<category> {
  @override
  final int typeId = 1;

  @override
  category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return category(
      name: fields[1] as String,
      id: fields[0] as String,
      type: fields[3] as categorytype,
      isdeleted: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, category obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isdeleted)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is categoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class categorytypeAdapter extends TypeAdapter<categorytype> {
  @override
  final int typeId = 2;

  @override
  categorytype read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return categorytype.income;
      case 1:
        return categorytype.expense;
      default:
        return categorytype.income;
    }
  }

  @override
  void write(BinaryWriter writer, categorytype obj) {
    switch (obj) {
      case categorytype.income:
        writer.writeByte(0);
        break;
      case categorytype.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is categorytypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
