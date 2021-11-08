// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_company_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductionCompanyCMAdapter extends TypeAdapter<ProductionCompanyCM> {
  @override
  final int typeId = 2;

  @override
  ProductionCompanyCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCompanyCM(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCompanyCM obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.originCountry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCompanyCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
