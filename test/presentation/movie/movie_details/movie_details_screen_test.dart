import 'package:domain/domain/model/movie_details/details/movie_details.dart';
import 'package:domain/domain/model/movie_details/production_company/production_company.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_tokenlab/generated/l10n.dart';
import 'package:teste_tokenlab/presentation/movie/movie_details/favorite_movie_result_state.dart';
import 'package:teste_tokenlab/presentation/movie/movie_details/movie_details_bloc.dart';
import 'package:teste_tokenlab/presentation/movie/movie_details/movie_details_result_state.dart';
import 'package:teste_tokenlab/presentation/movie/movie_details/movie_details_screen.dart';

import 'movie_details_screen_test.mocks.dart';

@GenerateMocks([MovieDetailsBloc])
void main() {
  late MockMovieDetailsBloc mockMovieDetailsBloc;
  setUpAll(() {
    mockMovieDetailsBloc = MockMovieDetailsBloc();
    S.load(const Locale('pt'));
  });
  setUp(() {
    reset(mockMovieDetailsBloc);
  });
  group('Movie Details Screen Test', () {
    testWidgets('it should show loading state', (tester) async {
      when(mockMovieDetailsBloc.movieDetailsResultState)
          .thenAnswer((_) => Stream.value(MovieDetailsLoadingState()));
      await tester.runAsync(() async {
        await tester
            .pumpWidget(_getMovieDetailsScreenWidget(mockMovieDetailsBloc));
        await tester.pump();
      });
      expect(find.byKey(const ValueKey('loading-widget')), findsOneWidget);
      verify(mockMovieDetailsBloc.movieDetailsResultState).called(1);
    });
    testWidgets('it should show success state', (tester) async {
      when(mockMovieDetailsBloc.movieDetailsResultState).thenAnswer((_) =>
          Stream.value(MovieDetailsSuccessState(_getMovieDetailsMock())));
      when(mockMovieDetailsBloc.addOrRemoveResultState)
          .thenAnswer((_) => Stream.value(SuccessAddFavoriteMovie()));
      await tester.runAsync(() async {
        await tester
            .pumpWidget(_getMovieDetailsScreenWidget(mockMovieDetailsBloc));
        await tester.pump();
        await tester.pump();
      });
      expect(find.byKey(const ValueKey('movie-details-success-widget')),
          findsOneWidget);
      verify(mockMovieDetailsBloc.movieDetailsResultState).called(1);
      verify(mockMovieDetailsBloc.addOrRemoveResultState).called(1);
    });
    testWidgets('it should show error state', (tester) async {
      when(mockMovieDetailsBloc.movieDetailsResultState)
          .thenAnswer((_) => Stream.value(MovieDetailsErrorState()));
      await tester.runAsync(() async {
        await tester
            .pumpWidget(_getMovieDetailsScreenWidget(mockMovieDetailsBloc));
        await tester.pump();
        await tester.pump();
      });
      expect(find.byKey(const ValueKey('error-widget')), findsOneWidget);
      verify(mockMovieDetailsBloc.movieDetailsResultState).called(1);
    });
  });
}

MaterialApp _getMovieDetailsScreenWidget(
        MockMovieDetailsBloc mockMovieDetailsBloc) =>
    MaterialApp(
        home: MovieDetailsScreen(
          movieDetailsBloc: mockMovieDetailsBloc,
          firebaseAnalytics: FirebaseAnalytics(),
          movieId: 240,
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ]);

MovieDetails _getMovieDetailsMock() => MovieDetails(
      const <String>['Drama', 'Crime'],
      'The Godfather: Part II',
      'https://image.tmdb.org/t/p/w200/bVq65huQ8vHDd1a4Z37QtuyEvpA.jpg',
      const <ProductionCompany>[
        ProductionCompany('Paramount', 'US'),
        ProductionCompany('The Coppola Company', '-')
      ],
      'The Godfather: Part II',
      8.5,
      240,
      isFavorite: false,
    );
