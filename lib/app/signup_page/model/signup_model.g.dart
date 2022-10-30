// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SigUpModelAdapter extends TypeAdapter<SigUpModel> {
  @override
  final int typeId = 1;

  @override
  SigUpModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SigUpModel(
      id: fields[0] as String?,
      email: fields[2] as String?,
      name: fields[1] as String?,
      number: fields[4] as String?,
      password: fields[5] as String?,
      profession: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SigUpModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.profession)
      ..writeByte(4)
      ..write(obj.number)
      ..writeByte(5)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SigUpModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
