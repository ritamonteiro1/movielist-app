import 'package:equatable/equatable.dart';

import '../production_company/production_company.dart';

class MovieDetails extends Equatable {
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

  @override
  List<Object?> get props => [
        genres,
        originalTitle,
        posterUrl,
        productionCompanies,
        title,
        voteAverage,
        id,
        isFavorite,
      ];
}
