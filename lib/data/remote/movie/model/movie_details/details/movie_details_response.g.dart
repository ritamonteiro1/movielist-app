// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsResponse _$MovieDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsResponse(
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['original_title'] as String?,
      json['poster_rrl'] as String?,
      (json['production_companies'] as List<dynamic>?)
          ?.map((e) =>
              ProductionCompanyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['title'] as String?,
      (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MovieDetailsResponseToJson(
        MovieDetailsResponse instance) =>
    <String, dynamic>{
      'genres': instance.genres,
      'original_title': instance.originalTitle,
      'poster_url': instance.posterUrl,
      'production_companies': instance.productionCompanies,
      'title': instance.title,
      'vote_average': instance.voteAverage,
    };
