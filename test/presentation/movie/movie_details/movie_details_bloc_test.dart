import 'dart:ffi';

import 'package:domain/domain/model/movie_details/details/movie_details.dart';
import 'package:domain/domain/model/movie_details/production_company/production_company.dart';
import 'package:domain/domain/use_case/add_favorite_movie_uc.dart';
import 'package:domain/domain/use_case/get_movie_details_uc.dart';
import 'package:domain/domain/use_case/remove_favorite_movie_uc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:teste_tokenlab/presentation/movie/movie_details/favorite_movie_result_state.dart';
import 'package:teste_tokenlab/presentation/movie/movie_details/movie_details_bloc.dart';
import 'package:teste_tokenlab/presentation/movie/movie_details/movie_details_result_state.dart';

import 'movie_details_bloc_test.mocks.dart';

@GenerateMocks([GetMovieDetailsUC, AddFavoriteMovieUC, RemoveFavoriteMovieUC])
void main() {
  late MockGetMovieDetailsUC mockGetMovieDetailsUC;
  late MockAddFavoriteMovieUC mockAddFavoriteMovieUC;
  late MockRemoveFavoriteMovieUC mockRemoveFavoriteMovieUC;
  late MovieDetailsBloc movieDetailsBloc;
  const movieId = 2;
  setUpAll(() {
    mockGetMovieDetailsUC = MockGetMovieDetailsUC();
    mockAddFavoriteMovieUC = MockAddFavoriteMovieUC();
    mockRemoveFavoriteMovieUC = MockRemoveFavoriteMovieUC();
  });
  setUp(() {
    reset(mockGetMovieDetailsUC);
    reset(mockAddFavoriteMovieUC);
    reset(mockRemoveFavoriteMovieUC);
  });
  group('fetchMovieDetails', () {
    test('verify get movie details is called', () async {
      when(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .thenAnswer((_) async => _getMovieDetailsMock());
      movieDetailsBloc = MovieDetailsBloc(mockGetMovieDetailsUC,
          mockAddFavoriteMovieUC, mockRemoveFavoriteMovieUC, movieId);
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsSuccessState>()
          ]));
      verify(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .called(1);
    });
    test('it should return a movie details', () async {
      when(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .thenAnswer((_) async => _getMovieDetailsMock());
      movieDetailsBloc = MovieDetailsBloc(mockGetMovieDetailsUC,
          mockAddFavoriteMovieUC, mockRemoveFavoriteMovieUC, movieId);
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsSuccessState>()
          ]));
      verify(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .called(1);
    });
    test('it should thrown an exception', () async {
      when(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .thenThrow(Exception());
      movieDetailsBloc = MovieDetailsBloc(mockGetMovieDetailsUC,
          mockAddFavoriteMovieUC, mockRemoveFavoriteMovieUC, movieId);
      expect(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsErrorState>()
          ]));
    });
  });
  group('toFavoriteMovie', () {
    test('verify add favorite movie list is called', () async {
      when(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .thenAnswer((_) async => _getMovieDetailsMock());
      movieDetailsBloc = MovieDetailsBloc(mockGetMovieDetailsUC,
          mockAddFavoriteMovieUC, mockRemoveFavoriteMovieUC, movieId);
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsSuccessState>(),
          ]));
      movieDetailsBloc.onFavoriteMovieInput.add(null);
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsSuccessState>(),
          ]));
      verify(mockAddFavoriteMovieUC.getFuture(params: anyNamed('params')))
          .called(1);
    });
    test('verify remove favorite movie list is called', () async {
      when(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .thenAnswer((_) async => _getMovieDetailsMock(isFavorite: true));
      movieDetailsBloc = MovieDetailsBloc(mockGetMovieDetailsUC,
          mockAddFavoriteMovieUC, mockRemoveFavoriteMovieUC, movieId);
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsSuccessState>(),
          ]));
      movieDetailsBloc.onFavoriteMovieInput.add(null);
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsSuccessState>(),
          ]));
      verify(mockRemoveFavoriteMovieUC.getFuture(params: anyNamed('params')))
          .called(1);
    });
    test('it should return a SuccessAddFavoriteMovie', () async {
      when(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .thenAnswer((_) async => _getMovieDetailsMock());
      when(mockAddFavoriteMovieUC.getFuture(params: anyNamed('params')))
          .thenAnswer((_) async => Void);
      movieDetailsBloc = MovieDetailsBloc(mockGetMovieDetailsUC,
          mockAddFavoriteMovieUC, mockRemoveFavoriteMovieUC, movieId);
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsSuccessState>(),
          ]));
      movieDetailsBloc.onFavoriteMovieInput.add(null);
      await expectLater(movieDetailsBloc.addOrRemoveResultState,
          emitsInOrder([isA<SuccessAddFavoriteMovie>()]));
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsSuccessState>(),
          ]));
      verify(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .called(1);
      verify(mockAddFavoriteMovieUC.getFuture(params: anyNamed('params')))
          .called(1);
    });
    test('it should return a SuccessRemoveFavoriteMovie', () async {
      when(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .thenAnswer((_) async => _getMovieDetailsMock(isFavorite: true));
      when(mockRemoveFavoriteMovieUC.getFuture(params: anyNamed('params')))
          .thenAnswer((_) async => Void);
      movieDetailsBloc = MovieDetailsBloc(mockGetMovieDetailsUC,
          mockAddFavoriteMovieUC, mockRemoveFavoriteMovieUC, movieId);
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsSuccessState>(),
          ]));
      movieDetailsBloc.onFavoriteMovieInput.add(null);
      await expectLater(movieDetailsBloc.addOrRemoveResultState,
          emitsInOrder([isA<SuccessRemoveFavoriteMovie>()]));
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsSuccessState>(),
          ]));
      verify(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .called(1);
      verify(mockRemoveFavoriteMovieUC.getFuture(params: anyNamed('params')))
          .called(1);
    });
    test('it should return an ErrorAddOrRemoveFavoriteMovie', () async {
      when(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .thenThrow(Exception());
      movieDetailsBloc = MovieDetailsBloc(mockGetMovieDetailsUC,
          mockAddFavoriteMovieUC, mockRemoveFavoriteMovieUC, movieId);
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsErrorState>(),
          ]));
      movieDetailsBloc.onFavoriteMovieInput.add(null);
      await expectLater(movieDetailsBloc.addOrRemoveResultState,
          emitsInOrder([isA<ErrorAddOrRemoveFavoriteMovie>()]));
      verify(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .called(1);
    });
    test('it should return isFavorite equals true', () async {
      when(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .thenAnswer((_) async => _getMovieDetailsMock());
      when(mockAddFavoriteMovieUC.getFuture(params: anyNamed('params')))
          .thenAnswer((_) async => Void);
      movieDetailsBloc = MovieDetailsBloc(mockGetMovieDetailsUC,
          mockAddFavoriteMovieUC, mockRemoveFavoriteMovieUC, movieId);
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsSuccessState>(),
          ]));
      movieDetailsBloc.onFavoriteMovieInput.add(null);
      await expectLater(movieDetailsBloc.addOrRemoveResultState,
          emitsInOrder([isA<SuccessAddFavoriteMovie>()]));
      await expectLater(movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([isA<MovieDetailsSuccessState>()]));
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsSuccessState>().having(
                (state) => state.movieDetails.isFavorite,
                'verify if isFavorite changed for true',
                true),
          ]));
      verify(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .called(1);
      verify(mockAddFavoriteMovieUC.getFuture(params: anyNamed('params')))
          .called(1);
    });
    test('it should return isFavorite equals false', () async {
      when(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .thenAnswer((_) async => _getMovieDetailsMock(isFavorite: true));
      when(mockRemoveFavoriteMovieUC.getFuture(params: anyNamed('params')))
          .thenAnswer((_) async => Void);
      movieDetailsBloc = MovieDetailsBloc(mockGetMovieDetailsUC,
          mockAddFavoriteMovieUC, mockRemoveFavoriteMovieUC, movieId);
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsLoadingState>(),
            isA<MovieDetailsSuccessState>(),
          ]));
      movieDetailsBloc.onFavoriteMovieInput.add(null);
      await expectLater(movieDetailsBloc.addOrRemoveResultState,
          emitsInOrder([isA<SuccessRemoveFavoriteMovie>()]));
      await expectLater(movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([isA<MovieDetailsSuccessState>()]));
      await expectLater(
          movieDetailsBloc.movieDetailsResultState,
          emitsInOrder([
            isA<MovieDetailsSuccessState>().having(
                (state) => state.movieDetails.isFavorite,
                'verify if isFavorite changed for false',
                false),
          ]));
      verify(mockGetMovieDetailsUC.getFuture(params: anyNamed('params')))
          .called(1);
      verify(mockRemoveFavoriteMovieUC.getFuture(params: anyNamed('params')))
          .called(1);
    });
  });
}

MovieDetails _getMovieDetailsMock({bool isFavorite = false}) => MovieDetails(
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
      isFavorite: isFavorite,
    );
