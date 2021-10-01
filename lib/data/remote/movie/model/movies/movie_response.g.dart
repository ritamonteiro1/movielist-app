// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      json['id'] as int,
      (json['vote_average'] as num).toDouble(),
      json['title'] as String,
      json['poster_url'] as String,
      json['release_date'] as String,
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'poster_url': instance.posterUrl,
      'release_date': instance.releaseDate,
    };
