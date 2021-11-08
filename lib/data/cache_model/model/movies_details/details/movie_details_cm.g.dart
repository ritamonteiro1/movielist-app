// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsCMAdapter extends TypeAdapter<MovieDetailsCM> {
  @override
  final int typeId = 1;

  @override
  MovieDetailsCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsCM(
      (fields[0] as List).cast<String>(),
      fields[1] as String,
      fields[2] as String,
      (fields[3] as List).cast<ProductionCompanyCM>(),
      fields[4] as String,
      fields[5] as double,
      fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsCM obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.genres)
      ..writeByte(1)
      ..write(obj.originalTitle)
      ..writeByte(2)
      ..write(obj.posterUrl)
      ..writeByte(3)
      ..write(obj.productionCompanies)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.voteAverage)
      ..writeByte(6)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
