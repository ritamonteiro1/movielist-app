// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsRM _$MovieDetailsRMFromJson(Map<String, dynamic> json) {
  return MovieDetailsRM(
    (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
    json['original_title'] as String,
    json['poster_url'] as String,
    (json['production_companies'] as List<dynamic>)
        .map((e) => ProductionCompanyRM.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['title'] as String,
    (json['vote_average'] as num).toDouble(),
    json['id'] as int,
  );
}

Map<String, dynamic> _$MovieDetailsRMToJson(MovieDetailsRM instance) =>
    <String, dynamic>{
      'genres': instance.genres,
      'original_title': instance.originalTitle,
      'poster_url': instance.posterUrl,
      'production_companies': instance.productionCompanies,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'id': instance.id,
    };
