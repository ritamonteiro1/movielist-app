import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teste_tokenlab/bloc/async_snapshot_response_view/async_snapshot_response_view.dart';
import 'package:teste_tokenlab/bloc/movie_details/movie_details_bloc.dart';
import 'package:teste_tokenlab/bloc/movie_details/movie_details_result_state.dart';
import 'package:teste_tokenlab/data/remote/movie/remote_data_source/movie_remote_data_source.dart';
import 'package:teste_tokenlab/data/remote/movie/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/data/remote/movie/repository/movie_repository.dart';
import 'package:teste_tokenlab/view/movie_details_view/widgets/successfully_request_movie_details_view_widget.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({required this.movieId, Key? key}) : super(key: key);
  final int movieId;

  @override
  _MovieDetailsViewState createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  late final MovieRemoteDataSource _movieRemoteDataSource;
  late final MovieDataRepository _movieDataRepository;
  late final MovieDetailsBloc _movieDetailsBloc;

  @override
  void initState() {
    super.initState();
    _movieRemoteDataSource = MovieRemoteDataSource(Dio());
    _movieDataRepository = MovieRepository(_movieRemoteDataSource);
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
      builder: (context, snapshot) => AsyncSnapshotResponseView<
              MovieDetailsLoadingState,
              MovieDetailsErrorState,
              MovieDetailsSuccessState>(
            snapshot: snapshot,
            onTryAgainTap: () =>
                _movieDetailsBloc.onTryAgain.add(widget.movieId),
            successWidgetBuilder: (context, successState) {
              final movieDetails = successState.movieDetails;
              return SuccessfullyRequestMovieDetails(
                  movieDetails: movieDetails);
            },
          ));
}
