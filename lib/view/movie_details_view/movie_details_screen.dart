
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teste_tokenlab/bloc/async_snapshot_response_view/async_snapshot_movies_response_view.dart';
import 'package:teste_tokenlab/bloc/movie_details/movie_details_bloc.dart';
import 'package:teste_tokenlab/bloc/movie_details/movie_details_result_state.dart';
import 'package:teste_tokenlab/data/cache_model/cache_data_source/movie_cache_data_source.dart';
import 'package:teste_tokenlab/data/remote/movie/remote_data_source/movie_remote_data_source.dart';
import 'package:teste_tokenlab/data/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/data/repository/movie_repository.dart';
import 'package:teste_tokenlab/view/movie_details_view/widgets/movie_details_widget_view.dart';
import 'package:teste_tokenlab/view/shared_view/error_view/error_widget_view.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({required this.movieId, Key? key}) : super(key: key);
  final int movieId;

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late final MovieCacheDataSource _movieCacheDataSource;
  late final MovieRemoteDataSource _movieRemoteDataSource;
  late final MovieDataRepository _movieDataRepository;
  late final MovieDetailsBloc _movieDetailsBloc;

  @override
  void initState() {
    super.initState();
    _movieCacheDataSource = MovieCacheDataSource();
    _movieRemoteDataSource = MovieRemoteDataSource(Dio());
    _movieDataRepository =
        MovieRepository(_movieRemoteDataSource, _movieCacheDataSource);
    _movieDetailsBloc = MovieDetailsBloc(_movieDataRepository, widget.movieId);
  }

  @override
  void dispose() {
    _movieDetailsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<MovieDetailsResultState>(
      stream: _movieDetailsBloc.movieDetailsResultState,
      initialData: MovieDetailsLoadingState(),
      builder: (context, snapshot) => AsyncSnapshotMoviesResponseView<
              MovieDetailsLoadingState,
              MovieDetailsErrorState,
              MovieDetailsSuccessState>(
            snapshot: snapshot,
            errorWidget: ErrorWidgetView(function: (){
              _movieDetailsBloc.onTryAgain.add(null);
            },),
            successWidgetBuilder: (context, successState) {
              final movieDetails = successState.movieDetails;
              return MovieDetailsWidgetView(
                movieDetails: movieDetails,
                movieDetailsBloc: _movieDetailsBloc,
              );
            },
          ));
}
