import 'package:teste_tokenlab/data/remote/movie/model/movie_details/production_company/production_company_rm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'movie_details_rm.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailsRM extends Equatable {
  const MovieDetailsRM(this.genres, this.originalTitle, this.posterUrl,
      this.productionCompanies, this.title, this.voteAverage, this.id);

  factory MovieDetailsRM.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsRMFromJson(json);

  final List<String> genres;
  final String originalTitle;
  final String posterUrl;
  final List<ProductionCompanyRM> productionCompanies;
  final String title;
  final double voteAverage;
  final int id;

  Map<String, dynamic> toJson() => _$MovieDetailsRMToJson(this);

  @override
  List<Object?> get props => [
        genres,
        originalTitle,
        posterUrl,
        productionCompanies,
        title,
        voteAverage,
        id,
      ];
}
