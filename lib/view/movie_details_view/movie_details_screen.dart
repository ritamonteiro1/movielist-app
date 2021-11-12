import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_tokenlab/bloc/async_snapshot_response_view/async_snapshot_movies_response_view.dart';
import 'package:teste_tokenlab/bloc/movie_details/movie_details_bloc.dart';
import 'package:teste_tokenlab/bloc/movie_details/movie_details_result_state.dart';
import 'package:teste_tokenlab/data/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/view/movie_details_view/widgets/movie_details_widget_view.dart';
import 'package:teste_tokenlab/view/shared_view/error_view/error_widget_view.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({
    required this.movieId,
    required this.movieDetailsBloc,
    Key? key,
  }) : super(key: key);
  final int movieId;
  final MovieDetailsBloc movieDetailsBloc;

  static Widget create(BuildContext context, int movieId) =>
      ProxyProvider<MovieDataRepository, MovieDetailsBloc>(
        update: (context, repository, bloc) =>
            bloc ??
            MovieDetailsBloc(repository, movieId),
        dispose: (context, bloc) => bloc.dispose(),
        child: Consumer<MovieDetailsBloc>(
          builder: (context, bloc, _) => MovieDetailsScreen(
            movieDetailsBloc: bloc, movieId: movieId,
          ),
        ),
      );

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.movieDetailsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<MovieDetailsResultState>(
      stream: widget.movieDetailsBloc.movieDetailsResultState,
      initialData: MovieDetailsLoadingState(),
      builder: (context, snapshot) => AsyncSnapshotMoviesResponseView<
              MovieDetailsLoadingState,
              MovieDetailsErrorState,
              MovieDetailsSuccessState>(
            snapshot: snapshot,
            errorWidget: ErrorWidgetView(
              function: () {
                widget.movieDetailsBloc.onTryAgain.add(null);
              },
            ),
            successWidgetBuilder: (context, successState) {
              final movieDetails = successState.movieDetails;
              return MovieDetailsWidgetView(
                movieDetails: movieDetails,
                movieDetailsBloc: widget.movieDetailsBloc,
              );
            },
          ));
}
