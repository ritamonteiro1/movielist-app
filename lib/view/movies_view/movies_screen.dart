import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_tokenlab/bloc/async_snapshot_response_view/async_snapshot_movies_response_view.dart';
import 'package:teste_tokenlab/bloc/movie_list/movies_bloc.dart';
import 'package:teste_tokenlab/bloc/movie_list/movies_result_state.dart';
import 'package:teste_tokenlab/data/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/generated/l10n.dart';
import 'package:teste_tokenlab/view/movies_view/widgets/movies_widget_view.dart';
import 'package:teste_tokenlab/view/shared_view/error_view/error_widget_view.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({
    required this.moviesBloc,
    Key? key,
  }) : super(key: key);
  final MoviesBloc moviesBloc;

  static Widget create(BuildContext context) =>
      ProxyProvider<MovieDataRepository, MoviesBloc>(
        update: (context, repository, bloc) =>
        bloc ??
            MoviesBloc(repository),
        dispose: (context, bloc) => bloc.dispose(),
        child: Consumer<MoviesBloc>(
          builder: (context, bloc, _) => MoviesScreen(
            moviesBloc: bloc,
          ),
        ),
      );

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.moviesBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<MoviesResultState>(
      stream: widget.moviesBloc.moviesResultState,
      initialData: MoviesLoadingState(),
      builder: (context, snapshot) => AsyncSnapshotMoviesResponseView<
              MoviesLoadingState, MoviesErrorState, MoviesSuccessState>(
            snapshot: snapshot,
            errorWidget: ErrorWidgetView(
              function: () {
                widget.moviesBloc.onTryAgain.add(null);
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
