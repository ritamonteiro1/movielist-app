import 'package:json_annotation/json_annotation.dart';
part 'movie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieResponse {
  MovieResponse(this.id, this.voteAverage, this.title, this.posterUrl,
      this.releaseDate);

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  final int id;
  final double voteAverage;
  final String title;
  final String posterUrl;
  final String releaseDate;

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);

}