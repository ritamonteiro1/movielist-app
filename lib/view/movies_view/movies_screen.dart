import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_tokenlab/bloc/async_snapshot_response_view/async_snapshot_movies_response_view.dart';
import 'package:teste_tokenlab/bloc/movie_list/movies_bloc.dart';
import 'package:teste_tokenlab/bloc/movie_list/movies_result_state.dart';
import 'package:teste_tokenlab/data/cache_model/cache_data_source/movie_cache_data_source.dart';
import 'package:teste_tokenlab/data/remote/movie/remote_data_source/movie_remote_data_source.dart';
import 'package:teste_tokenlab/data/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/data/repository/movie_repository.dart';
import 'package:teste_tokenlab/view/movies_view/widgets/movies_widget_view.dart';
import 'package:teste_tokenlab/view/shared_view/error_view/error_widget_view.dart';
import 'package:teste_tokenlab/generated/l10n.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late final MovieCacheDataSource _movieCacheDataSource;
  late final MovieRemoteDataSource _movieRemoteDataSource;
  late final MovieDataRepository _movieDataRepository;
  late final MoviesBloc _moviesBloc;

  @override
  void initState() {
    super.initState();
    _movieCacheDataSource = MovieCacheDataSource();
    _movieRemoteDataSource = MovieRemoteDataSource(Dio());
    _movieDataRepository =
        MovieRepository(_movieRemoteDataSource, _movieCacheDataSource);
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
      builder: (context, snapshot) => AsyncSnapshotMoviesResponseView<
              MoviesLoadingState, MoviesErrorState, MoviesSuccessState>(
            snapshot: snapshot,
            errorWidget: ErrorWidgetView(
              function: () {
                _moviesBloc.onTryAgain.add(null);
              },
            ),
            successWidgetBuilder: (context, successState) {
              final movieList = successState.movies;
              return MoviesWidgetView(
                movies: movieList,
                appBarTitle:
                    S.of(context).successfullyRequestMoviesViewAppBarTitle,
              );
            },
          ));
}
