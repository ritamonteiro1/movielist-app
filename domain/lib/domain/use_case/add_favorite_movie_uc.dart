import 'package:domain/domain/use_case/use_case.dart';

import '../data_repository/movie_data_repository.dart';

class AddFavoriteMovieUC extends UseCase<AddFavoriteMovieUCParams, void> {
  AddFavoriteMovieUC(
    this.movieDataRepository,
  );

  final MovieDataRepository movieDataRepository;

  @override
  Future<void> getRawFuture({required AddFavoriteMovieUCParams params}) =>
      movieDataRepository.addFavoriteMovie(params.movieId);
}

class AddFavoriteMovieUCParams {
  AddFavoriteMovieUCParams(
    this.movieId,
  );

  final int movieId;
}
