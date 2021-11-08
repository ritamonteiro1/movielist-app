import 'package:json_annotation/json_annotation.dart';
part 'movie_rm.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieRM {
  MovieRM(this.id, this.voteAverage, this.title, this.posterUrl,
      this.releaseDate);

  factory MovieRM.fromJson(Map<String, dynamic> json) =>
      _$MovieRMFromJson(json);

  final int id;
  final double voteAverage;
  final String title;
  final String posterUrl;
  final String releaseDate;

  Map<String, dynamic> toJson() => _$MovieRMToJson(this);

}