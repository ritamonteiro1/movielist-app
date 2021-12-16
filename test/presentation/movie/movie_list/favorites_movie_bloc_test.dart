import 'package:domain/domain/model/movies/movie.dart';
import 'package:domain/domain/use_case/get_favorite_movie_list_uc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/favorites_movie_bloc.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/favorites_movie_result_state.dart';

import 'favorites_movie_bloc_test.mocks.dart';

@GenerateMocks([GetFavoriteMovieListUC])
void main() {
  late MockGetFavoriteMovieListUC mockGetFavoriteMovieListUC;
  late FavoritesMovieBloc favoritesMovieBloc;
  setUpAll(() {
    mockGetFavoriteMovieListUC = MockGetFavoriteMovieListUC();
  });
  setUp(() {
    reset(mockGetFavoriteMovieListUC);
  });
  group('fetchFavoriteMoviesId', () {
    test('verify favorite movie list is called', () async {
      when(mockGetFavoriteMovieListUC.getFuture(params: null))
          .thenAnswer((_) async => _getMovieListMock());
      favoritesMovieBloc = FavoritesMovieBloc(mockGetFavoriteMovieListUC);
      favoritesMovieBloc.favoriteMoviesCallback.add(null);
      await expectLater(
          favoritesMovieBloc.favoriteMoviesResultState,
          emitsInOrder([
            isA<FavoritesMovieLoadingState>(),
            isA<FavoritesMovieLoadingState>(),
            isA<FavoritesMovieSuccessState>()
          ]));
      verify(mockGetFavoriteMovieListUC.getFuture(params: null)).called(1);
    });
    test('it should return a favorite movie list', () async {
      when(mockGetFavoriteMovieListUC.getFuture(params: null))
          .thenAnswer((_) async => _getMovieListMock());
      favoritesMovieBloc = FavoritesMovieBloc(mockGetFavoriteMovieListUC);
      favoritesMovieBloc.favoriteMoviesCallback.add(null);
      await expectLater(
          favoritesMovieBloc.favoriteMoviesResultState,
          emitsInOrder([
            isA<FavoritesMovieLoadingState>(),
            isA<FavoritesMovieLoadingState>(),
            isA<FavoritesMovieSuccessState>()
          ]));
      verify(mockGetFavoriteMovieListUC.getFuture(params: null)).called(1);
    });
    test('it should return an empty favorite movie list', () async {
      when(mockGetFavoriteMovieListUC.getFuture(params: null))
          .thenAnswer((_) async => <Movie>[]);
      favoritesMovieBloc = FavoritesMovieBloc(mockGetFavoriteMovieListUC);
      favoritesMovieBloc.favoriteMoviesCallback.add(null);
      await expectLater(
          favoritesMovieBloc.favoriteMoviesResultState,
          emitsInOrder([
            isA<FavoritesMovieLoadingState>(),
            isA<FavoritesMovieLoadingState>(),
            isA<FavoritesMovieNoResultState>()
          ]));
      verify(mockGetFavoriteMovieListUC.getFuture(params: null)).called(1);
    });
    test('it should thrown an exception', () async {
      when(mockGetFavoriteMovieListUC.getFuture(params: null))
          .thenThrow(Exception());
      favoritesMovieBloc = FavoritesMovieBloc(mockGetFavoriteMovieListUC);
      favoritesMovieBloc.favoriteMoviesCallback.add(null);
      await expectLater(
          favoritesMovieBloc.favoriteMoviesResultState,
          emitsInOrder([
            isA<FavoritesMovieLoadingState>(),
            isA<FavoritesMovieLoadingState>(),
            isA<FavoritesMovieNoResultState>()
          ]));
      verify(mockGetFavoriteMovieListUC.getFuture(params: null)).called(1);
    });
  });
}

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
