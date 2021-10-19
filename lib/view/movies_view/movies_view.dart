import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_tokenlab/bloc/async_snapshot_response_view/async_snapshot_response_view.dart';
import 'package:teste_tokenlab/bloc/movie_list/movies_bloc.dart';
import 'package:teste_tokenlab/bloc/movie_list/movies_result_state.dart';
import 'package:teste_tokenlab/data/remote/movie/remote_data_source/movie_remote_data_source.dart';
import 'package:teste_tokenlab/data/remote/movie/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/data/remote/movie/repository/movie_repository.dart';
import 'package:teste_tokenlab/view/movies_view/widgets/successfully_request_movies_view_widget.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  _MoviesViewState createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  late final MovieRemoteDataSource _movieRemoteDataSource;
  late final MovieDataRepository _movieDataRepository;
  late final MoviesBloc _moviesBloc;

  @override
  void initState() {
    super.initState();
    _movieRemoteDataSource = MovieRemoteDataSource(Dio());
    _movieDataRepository = MovieRepository(_movieRemoteDataSource);
    _moviesBloc = MoviesBloc(_movieDataRepository);
  }

  @override
  void dispose() {
    _moviesBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<MoviesResultState>(
      stream: _moviesBloc.moviesResultState,
      initialData: MoviesLoadingState(),
      builder: (context, snapshot) => AsyncSnapshotResponseView<
              MoviesLoadingState, MoviesErrorState, MoviesSuccessState>(
            snapshot: snapshot,
            onTryAgainTap: () => _moviesBloc.onTryAgain.add(null),
            successWidgetBuilder: (context, successState) {
              final movieList = successState.movies;
              return SuccessfullyRequestMovies(movies: movieList);
            },
          ));
}
