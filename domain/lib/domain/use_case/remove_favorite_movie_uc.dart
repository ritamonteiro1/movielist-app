import 'package:domain/domain/use_case/use_case.dart';

import '../data_repository/movie_data_repository.dart';

class RemoveFavoriteMovieUC extends UseCase<RemoveFavoriteMovieUCParams, void> {
  RemoveFavoriteMovieUC(
    this.movieDataRepository,
  );

  final MovieDataRepository movieDataRepository;

  @override
  Future<void> getRawFuture({required RemoveFavoriteMovieUCParams params}) =>
      movieDataRepository.removeFavoriteMovie(params.movieId);
}

class RemoveFavoriteMovieUCParams {
  RemoveFavoriteMovieUCParams(
    this.movieId,
  );

  final int movieId;
}
