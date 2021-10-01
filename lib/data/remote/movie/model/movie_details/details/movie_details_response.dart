
import 'package:teste_tokenlab/data/remote/movie/model/movie_details/production_company/production_company_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailsResponse {
  MovieDetailsResponse(
      this.genres,
      this.originalTitle,
      this.posterUrl,
      this.productionCompanies,
      this.title,
      this.voteAverage);

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);

  final List<String> genres;
  final String originalTitle;
  final String posterUrl;
  final List<ProductionCompanyResponse> productionCompanies;
  final String title;
  final double voteAverage;

  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);

}
