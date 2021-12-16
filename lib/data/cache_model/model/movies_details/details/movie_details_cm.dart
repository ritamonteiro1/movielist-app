import 'package:hive/hive.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies_details/production_company/production_company_cm.dart';
import 'package:equatable/equatable.dart';

part 'movie_details_cm.g.dart';

@HiveType(typeId: 1)
class MovieDetailsCM extends Equatable {
  const MovieDetailsCM(this.genres, this.originalTitle, this.posterUrl,
      this.productionCompanies, this.title, this.voteAverage, this.id);

  @HiveField(0)
  final List<String> genres;
  @HiveField(1)
  final String originalTitle;
  @HiveField(2)
  final String posterUrl;
  @HiveField(3)
  final List<ProductionCompanyCM> productionCompanies;
  @HiveField(4)
  final String title;
  @HiveField(5)
  final double voteAverage;
  @HiveField(6)
  final int id;

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
