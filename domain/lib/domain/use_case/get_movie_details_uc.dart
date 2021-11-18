import 'package:domain/domain/use_case/use_case.dart';

import '../data_repository/movie_data_repository.dart';

import '../model/movie_details/details/movie_details.dart';

class GetMovieDetailsUC extends UseCase<GetMovieDetailsUCParams, MovieDetails> {
  GetMovieDetailsUC(
    this.movieDataRepository,
  );

  final MovieDataRepository movieDataRepository;

  @override
  Future<MovieDetails> getRawFuture(
          {required GetMovieDetailsUCParams params}) =>
      movieDataRepository.fetchMovieDetails(params.movieId);
}

class GetMovieDetailsUCParams {
  GetMovieDetailsUCParams(
    this.movieId,
  );

  final int movieId;
}
