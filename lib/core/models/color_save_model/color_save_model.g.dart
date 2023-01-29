// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_save_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ColorSaveModelAdapter extends TypeAdapter<ColorSaveModel> {
  @override
  final int typeId = 0;

  @override
  ColorSaveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ColorSaveModel(
      hex: (fields[0] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ColorSaveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.hex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorSaveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
