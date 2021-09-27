import 'package:teste_tokenlab/domain/movie_details/production_company/production_company_model.dart';

class MovieDetailsModel {
  MovieDetailsModel(
      this.genres,
      this.originalTitle,
      this.posterUrl,
      this.productionCompanies,
      this.title,
      this.voteAverage,
  );

  final List<String> genres;
  final String originalTitle;
  final String posterUrl;
  final List<ProductionCompanyModel> productionCompanies;
  final String title;
  final double voteAverage;
}
