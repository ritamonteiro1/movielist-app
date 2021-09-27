import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teste_tokenlab/data/remote/movie/remote_data_source/movie_remote_data_source.dart';
import 'package:teste_tokenlab/data/remote/movie/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/data/remote/movie/repository/movie_repository.dart';
import 'package:teste_tokenlab/view/movie_details_view/widgets/successfully_request_movie_details_view_widget.dart';
import 'package:teste_tokenlab/view/shared_views/error_view/error_widget_view.dart';
import 'package:teste_tokenlab/view/shared_views/loading_view/loading_widget_view.dart';
import 'package:teste_tokenlab/view_model/movie_details_result_state.dart';
import 'package:teste_tokenlab/view_model/movie_details_view_model.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({required this.movieId, Key? key}) : super(key: key);
  final int movieId;

  @override
  _MovieDetailsViewState createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  static final MovieRemoteDataSource _movieRemoteDataSource =
      MovieRemoteDataSource(Dio());
  static final MovieDataRepository _movieDataRepository =
      MovieRepository(_movieRemoteDataSource);
  final MovieDetailsViewModel _viewModel =
      MovieDetailsViewModel(_movieDataRepository);

  @override
  void initState() {
    super.initState();
    fetchMovieDetails();
  }

  @override
  Widget build(BuildContext context) =>
      ValueListenableBuilder<MovieDetailsResultState>(
          valueListenable: _viewModel.resultState,
          builder: (context, resultState, _) {
            if (resultState is MovieDetailsLoadingState) {
              return const LoadingWidget();
            } else if (resultState is MovieDetailsErrorState) {
              return ErrorViewWidget(function: fetchMovieDetails);
            } else if (resultState is MovieDetailsSuccessState) {
              return SuccessfullyRequestMovieDetails(
                  movieDetails: resultState.movieDetails);
            } else {
              return Container();
            }
          });

  void fetchMovieDetails() {
    _viewModel.fetchMovieDetails(widget.movieId);
  }
}
