
import 'package:teste_tokenlab/data/remote/movie/model/movies/movie_response.dart';
import 'package:teste_tokenlab/domain/movies/movie_model.dart';
import 'package:teste_tokenlab/extensions/string_extensions.dart';

extension ListMovieResponseExtensions on List<MovieResponse> {

  List<MovieModel> toMovieListModel () => map((item) => MovieModel(
        item.id,
        item.voteAverage,
        item.title.isBlank() ? '-' : item.title,
        item.posterUrl,
        item.releaseDate.convertDateToLocaleBr()))
        .toList();
}