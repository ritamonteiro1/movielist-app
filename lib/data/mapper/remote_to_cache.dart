
import 'package:teste_tokenlab/data/cache_model/model/movies/movie_cm.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies_details/details/movie_details_cm.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies_details/production_company/production_company_cm.dart';
import 'package:teste_tokenlab/data/remote/movie/model/movie_details/details/movie_details_rm.dart';
import 'package:teste_tokenlab/data/remote/movie/model/movies/movie_rm.dart';
import 'package:teste_tokenlab/extensions/string_extensions.dart';


extension ListMovieRMToListMovieCMExtensions on List<MovieRM> {
  List<MovieCM> toMovieListCM () => map((item) => MovieCM(
      item.id,
      item.voteAverage,
      item.title,
      item.posterUrl,
      item.releaseDate
  )).toList();
}

extension MovieDetailsRMToMovieDetailsCMExtensions on MovieDetailsRM {
  MovieDetailsCM toMovieDetailsCM() => MovieDetailsCM(
      genres,
      originalTitle.isBlank() ? '-' : originalTitle,
      posterUrl,
      productionCompanies
          .map((item) => ProductionCompanyCM(
          item.name.isBlank() ? '-' : item.name,
          item.originCountry.isBlank() ? '-' : item.originCountry))
          .toList(),
      title.isBlank() ? '-' : title,
      voteAverage,
      id);
}

