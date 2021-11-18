import 'package:domain/domain/model/movie_details/details/movie_details.dart';
import 'package:domain/domain/model/movie_details/production_company/production_company.dart';
import 'package:domain/domain/model/movies/movie.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies/movie_cm.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies_details/details/movie_details_cm.dart';

import 'package:teste_tokenlab/extensions/string_extensions.dart';

extension ListMovieCMToListMovieDMExtensions on List<MovieCM> {
  List<Movie> toMovieListDM() => map((item) => Movie(item.id, item.voteAverage,
      item.title, item.posterUrl, item.releaseDate)).toList();
}

extension MovieDetailsCMToMovieDetailsDMExtensions on MovieDetailsCM {
  MovieDetails toMovieDetailsDM() => MovieDetails(
      genres,
      originalTitle.isBlank() ? '-' : originalTitle,
      posterUrl,
      productionCompanies
          .map((item) => ProductionCompany(
              item.name.isBlank() ? '-' : item.name,
              item.originCountry.isBlank() ? '-' : item.originCountry))
          .toList(),
      title.isBlank() ? '-' : title,
      voteAverage,
      id);
}
