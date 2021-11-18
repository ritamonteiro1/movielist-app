
import '../production_company/production_company.dart';

class MovieDetails {
  MovieDetails(this.genres, this.originalTitle, this.posterUrl,
      this.productionCompanies, this.title, this.voteAverage, this.id,
      {this.isFavorite = false});

  final List<String> genres;
  final String originalTitle;
  final String posterUrl;
  final List<ProductionCompany> productionCompanies;
  final String title;
  final double voteAverage;
  final int id;
  bool isFavorite;
}
