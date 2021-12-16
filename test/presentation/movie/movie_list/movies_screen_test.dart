import 'package:domain/domain/model/movies/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_tokenlab/generated/l10n.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/movies_bloc.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/movies_result_state.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/movies_screen.dart';

import 'movies_screen_test.mocks.dart';

@GenerateMocks([MoviesBloc])
void main() {
  late MockMoviesBloc mockMoviesBloc;
  setUpAll(() {
    mockMoviesBloc = MockMoviesBloc();
    S.load(const Locale('pt'));
  });
  setUp(() {
    reset(mockMoviesBloc);
  });
  group('Movies Screen Test', () {
    testWidgets('it should show loading state', (tester) async {
      when(mockMoviesBloc.moviesResultState)
          .thenAnswer((_) => Stream.value(MoviesLoadingState()));
      await tester.runAsync(() async {
        await tester.pumpWidget(_getMoviesScreenWidget(mockMoviesBloc));
        await tester.pump();
      });
      expect(find.byKey(const ValueKey('loading-widget')), findsOneWidget);
      verify(mockMoviesBloc.moviesResultState).called(1);
    });
    testWidgets('it should show success state', (tester) async {
      when(mockMoviesBloc.moviesResultState).thenAnswer(
          (_) => Stream.value(MoviesSuccessState(_getMovieListMock())));
      await tester.runAsync(() async {
        await tester.pumpWidget(_getMoviesScreenWidget(mockMoviesBloc));
        await tester.pump();
        await tester.pump();
      });
      expect(find.byKey(const ValueKey('movie-list-success-widget')),
          findsOneWidget);
      verify(mockMoviesBloc.moviesResultState).called(1);
    });
    testWidgets('it should show error state', (tester) async {
      when(mockMoviesBloc.moviesResultState)
          .thenAnswer((_) => Stream.value(MoviesErrorState()));
      await tester.runAsync(() async {
        await tester.pumpWidget(_getMoviesScreenWidget(mockMoviesBloc));
        await tester.pump();
        await tester.pump();
      });
      await expectLater(
          find.byKey(const ValueKey('error-widget')), findsOneWidget);
      verify(mockMoviesBloc.moviesResultState).called(1);
    });
  });
}

MaterialApp _getMoviesScreenWidget(MockMoviesBloc mockMoviesBloc) =>
    MaterialApp(
        home: MoviesScreen(moviesBloc: mockMoviesBloc),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ]);

List<Movie> _getMovieListMock() => <Movie>[
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
