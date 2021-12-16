import 'package:domain/domain/model/movies/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_tokenlab/generated/l10n.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/favorite_movies_screen.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/favorites_movie_bloc.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/favorites_movie_result_state.dart';

import 'favorite_movies_screen_test.mocks.dart';

@GenerateMocks([FavoritesMovieBloc])
void main() {
  late MockFavoritesMovieBloc mockFavoritesMovieBloc;
  setUpAll(() {
    mockFavoritesMovieBloc = MockFavoritesMovieBloc();
    S.load(const Locale('pt'));
  });
  setUp(() {
    reset(mockFavoritesMovieBloc);
  });
  group('Favorite Movies Screen Test', () {
    testWidgets('it should show loading state', (tester) async {
      when(mockFavoritesMovieBloc.favoriteMoviesResultState)
          .thenAnswer((_) => Stream.value(FavoritesMovieLoadingState()));
      await tester.runAsync(() async {
        await tester
            .pumpWidget(_getFavoriteMoviesScreenWidget(mockFavoritesMovieBloc));
        await tester.pump();
      });
      expect(find.byKey(const ValueKey('loading-widget')), findsOneWidget);
      verify(mockFavoritesMovieBloc.favoriteMoviesResultState).called(1);
    });
    testWidgets('it should show success state', (tester) async {
      when(mockFavoritesMovieBloc.favoriteMoviesResultState).thenAnswer((_) =>
          Stream.value(
              FavoritesMovieSuccessState(_getFavoriteMovieListMock())));
      await tester.runAsync(() async {
        await tester
            .pumpWidget(_getFavoriteMoviesScreenWidget(mockFavoritesMovieBloc));
        await tester.pump();
        await tester.pump();
      });
      expect(find.byKey(const ValueKey('movie-list-success-widget')),
          findsOneWidget);
      verify(mockFavoritesMovieBloc.favoriteMoviesResultState).called(1);
    });
    testWidgets(
        'it should show no result state because favorite movie list is empty',
        (tester) async {
      when(mockFavoritesMovieBloc.favoriteMoviesResultState)
          .thenAnswer((_) => Stream.value(FavoritesMovieNoResultState()));
      await tester.runAsync(() async {
        await tester
            .pumpWidget(_getFavoriteMoviesScreenWidget(mockFavoritesMovieBloc));
        await tester.pump();
        await tester.pump();
      });
      expect(
          find.byKey(
              const ValueKey('empty-favorite-movie-list-success-widget')),
          findsOneWidget);
      verify(mockFavoritesMovieBloc.favoriteMoviesResultState).called(1);
    });
  });
}

MaterialApp _getFavoriteMoviesScreenWidget(
        MockFavoritesMovieBloc mockFavoritesMovieBloc) =>
    MaterialApp(
        home: FavoriteMoviesScreen(
          favoritesMovieBloc: mockFavoritesMovieBloc,
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ]);

List<Movie> _getFavoriteMovieListMock() => <Movie>[
      const Movie(
        19404,
        9.3,
        'Dilwale Dulhania Le Jayenge',
        'https://image.tmdb.org/t/p/w200/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg',
        '1995-10-20',
      ),
      const Movie(
        278,
        8.6,
        'The Shawshank Redemption',
        'https://image.tmdb.org/t/p/w200/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg',
        '1994-09-23',
      ),
    ];
