// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRM _$MovieRMFromJson(Map<String, dynamic> json) {
  return MovieRM(
    json['id'] as int,
    (json['vote_average'] as num).toDouble(),
    json['title'] as String,
    json['poster_url'] as String,
    json['release_date'] as String,
  );
}

Map<String, dynamic> _$MovieRMToJson(MovieRM instance) => <String, dynamic>{
      'id': instance.id,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'poster_url': instance.posterUrl,
      'release_date': instance.releaseDate,
    };
