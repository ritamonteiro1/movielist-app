// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieCMAdapter extends TypeAdapter<MovieCM> {
  @override
  final int typeId = 0;

  @override
  MovieCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieCM(
      fields[0] as int,
      fields[1] as double,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieCM obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.voteAverage)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.posterUrl)
      ..writeByte(4)
      ..write(obj.releaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
