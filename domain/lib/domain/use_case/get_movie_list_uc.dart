import 'package:domain/domain/use_case/use_case.dart';

import '../data_repository/movie_data_repository.dart';

import '../model/movies/movie.dart';

class GetMovieListUC extends UseCase<Null, List<Movie>> {
  GetMovieListUC(
    this.movieDataRepository,
  );

  final MovieDataRepository movieDataRepository;

  @override
  Future<List<Movie>> getRawFuture({required Null params}) async =>
      movieDataRepository.fetchMovieList();
}
