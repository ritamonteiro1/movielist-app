import 'package:domain/domain/use_case/get_favorite_movie_list_uc.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:provider/provider.dart';

import 'package:teste_tokenlab/generated/l10n.dart';
import 'package:teste_tokenlab/presentation/common/async_snapshot_movies_response_view.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/favorites_movie_bloc.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/favorites_movie_result_state.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/movies_widget_view.dart';

class FavoriteMoviesScreen extends StatefulWidget {
  const FavoriteMoviesScreen({
    required this.favoritesMovieBloc,
    Key? key,
  }) : super(key: key);
  final FavoritesMovieBloc favoritesMovieBloc;

  static Widget create(BuildContext context) =>
      ProxyProvider<GetFavoriteMovieListUC, FavoritesMovieBloc>(
        update: (context, getFavoriteMovieListUC, bloc) =>
            bloc ?? FavoritesMovieBloc(getFavoriteMovieListUC),
        dispose: (context, bloc) => bloc.dispose(),
        child: Consumer<FavoritesMovieBloc>(
          builder: (context, bloc, _) => FavoriteMoviesScreen(
            favoritesMovieBloc: bloc,
          ),
        ),
      );

  @override
  _FavoriteMoviesScreenState createState() => _FavoriteMoviesScreenState();
}

class _FavoriteMoviesScreenState extends State<FavoriteMoviesScreen> {
  final _focusDetectorKey = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.favoritesMovieBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FocusDetector(
        key: _focusDetectorKey,
        onFocusGained: () {
          widget.favoritesMovieBloc.favoriteMoviesCallback.add(null);
        },
        child: StreamBuilder<FavoritesMovieResultState>(
            stream: widget.favoritesMovieBloc.favoriteMoviesResultState,
            initialData: FavoritesMovieLoadingState(),
            builder: (context, snapshot) => AsyncSnapshotMoviesResponseView<
                    FavoritesMovieLoadingState,
                    FavoritesMovieNoResultState,
                    FavoritesMovieSuccessState>(
                  snapshot: snapshot,
                  errorWidget: Scaffold(
                    appBar: AppBar(
                      title: Text(S
                          .of(context)
                          .errorAsyncSnapshotFavoriteMoviesTitleAppBar),
                    ),
                    body: Center(
                      child: Text(
                        S.of(context).errorAsyncSnapshotFavoriteMoviesBodyText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      ),
                    ),
                  ),
                  successWidgetBuilder: (context, successState) {
                    final favoritesMovie = successState.favoritesMovie;
                    return MoviesWidgetView(
                      movies: favoritesMovie,
                      appBarTitle: S.of(context).favoriteMoviesViewAppBarTitle,
                    );
                  },
                )),
      );
}
