import 'package:flutter/cupertino.dart';
import 'package:teste_tokenlab/data/remote/movie/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/view_model/movie_details_result_state.dart';

class MovieDetailsViewModel {
  MovieDetailsViewModel(this._movieRepository);
  final MovieDataRepository _movieRepository;

  final ValueNotifier<MovieDetailsResultState> resultState =
  ValueNotifier<MovieDetailsResultState>(MovieDetailsLoadingState());

  void fetchMovieDetails(int movieId){
    resultState.value = MovieDetailsLoadingState();
    _movieRepository.fetchMovieDetails(movieId).then((value) {
      resultState.value = MovieDetailsSuccessState(value);
    }).onError((error, stackTrace) {
      resultState.value = MovieDetailsErrorState();
    });
  }
}
