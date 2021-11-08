import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teste_tokenlab/bloc/async_snapshot_response_view/async_snapshot_movies_response_view.dart';
import 'package:teste_tokenlab/bloc/favorite_movies/favorites_movie_bloc.dart';
import 'package:teste_tokenlab/bloc/favorite_movies/favorites_movie_result_state.dart';
import 'package:teste_tokenlab/data/cache_model/cache_data_source/movie_cache_data_source.dart';
import 'package:teste_tokenlab/data/remote/movie/remote_data_source/movie_remote_data_source.dart';
import 'package:teste_tokenlab/data/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/data/repository/movie_repository.dart';
import 'package:teste_tokenlab/generated/l10n.dart';
import 'package:teste_tokenlab/view/movies_view/widgets/movies_widget_view.dart';
import 'package:teste_tokenlab/generated/l10n.dart';

class FavoriteMoviesScreen extends StatefulWidget {
  const FavoriteMoviesScreen({Key? key}) : super(key: key);

  @override
  _FavoriteMoviesScreenState createState() => _FavoriteMoviesScreenState();
}

class _FavoriteMoviesScreenState extends State<FavoriteMoviesScreen> {
  late final MovieCacheDataSource _movieCacheDataSource;
  late final MovieRemoteDataSource _movieRemoteDataSource;
  late final MovieDataRepository _movieDataRepository;
  late final FavoritesMovieBloc _favoritesMovieBloc;

  @override
  void initState() {
    super.initState();
    _movieCacheDataSource = MovieCacheDataSource();
    _movieRemoteDataSource = MovieRemoteDataSource(Dio());
    _movieDataRepository =
        MovieRepository(_movieRemoteDataSource, _movieCacheDataSource);
    _favoritesMovieBloc = FavoritesMovieBloc(_movieDataRepository);
  }

  @override
  void dispose() {
    _favoritesMovieBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      StreamBuilder<FavoritesMovieResultState>(
          stream: _favoritesMovieBloc.favoriteMoviesResultState,
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
              ));
}
