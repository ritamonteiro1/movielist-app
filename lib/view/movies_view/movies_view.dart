import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teste_tokenlab/data/remote/movie/remote_data_source/movie_remote_data_source.dart';
import 'package:teste_tokenlab/data/remote/movie/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/data/remote/movie/repository/movie_repository.dart';
import 'package:teste_tokenlab/view/movies_view/widgets/successfully_request_movies_view_widget.dart';
import 'package:teste_tokenlab/view/shared_views/error_view/error_widget_view.dart';
import 'package:teste_tokenlab/view/shared_views/loading_view/loading_widget_view.dart';
import 'package:teste_tokenlab/view_model/movies_result_state.dart';
import 'package:teste_tokenlab/view_model/movies_view_model.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  _MoviesViewState createState() =>
      _MoviesViewState();
}

class _MoviesViewState
    extends State<MoviesView> {
  static final MovieRemoteDataSource _movieRemoteDataSource =
      MovieRemoteDataSource(Dio());
  static final MovieDataRepository _movieDataRepository =
      MovieRepository(_movieRemoteDataSource);
  final MoviesViewModel _viewModel = MoviesViewModel(_movieDataRepository);

  @override
  void initState() {
    super.initState();
    _viewModel.fetchMovieList();
  }

  @override
  Widget build(BuildContext context) =>
      ValueListenableBuilder<MoviesResultState>(
          valueListenable: _viewModel.resultState,
          builder: (context, resultState, _) {
            if (resultState is MoviesLoadingState) {
              return const LoadingWidget();
            } else if (resultState is MoviesErrorState) {
              return ErrorViewWidget(function: _viewModel.fetchMovieList);
            } else if (resultState is MoviesSuccessState) {
              return SuccessfullyRequestMovies(movies: resultState.movies);
            } else {
              return Container();
            }
          });
}
