import 'package:flutter/cupertino.dart';
import 'package:teste_tokenlab/data/remote/movie/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/view_model/movies_result_state.dart';

class MoviesViewModel {
  MoviesViewModel(this._movieRepository);
  final MovieDataRepository _movieRepository;

  final ValueNotifier<MoviesResultState> resultState =
      ValueNotifier<MoviesResultState>(MoviesLoadingState());

  void fetchMovieList() {
    resultState.value = MoviesLoadingState();
    _movieRepository.fetchMovieList().then((value) {
      resultState.value = MoviesSuccessState(value);
    }).onError((error, stackTrace) {
      resultState.value = MoviesErrorState();
    });
  }
}
