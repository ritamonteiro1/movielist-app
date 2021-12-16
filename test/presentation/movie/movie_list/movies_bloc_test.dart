import 'package:domain/domain/model/movies/movie.dart';
import 'package:domain/domain/use_case/get_movie_list_uc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/movies_bloc.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/movies_result_state.dart';

import 'movies_bloc_test.mocks.dart';

@GenerateMocks([GetMovieListUC])
void main() {
  late MockGetMovieListUC mockGetMovieListUC;
  late MoviesBloc moviesBloc;
  setUpAll(() {
    mockGetMovieListUC = MockGetMovieListUC();
  });
  setUp(() {
    reset(mockGetMovieListUC);
  });
  group('fetchMovieList', () {
    test('verify get movie list is called', () async {
      when(mockGetMovieListUC.getFuture(params: null))
          .thenAnswer((_) async => _getMovieListMock());
      moviesBloc = MoviesBloc(mockGetMovieListUC);
      await expectLater(moviesBloc.moviesResultState,
          emitsInOrder([isA<MoviesLoadingState>(), isA<MoviesSuccessState>()]));
      verify(mockGetMovieListUC.getFuture(params: null)).called(1);
    });
    test('it should return a movie list', () async {
      when(mockGetMovieListUC.getFuture(params: null))
          .thenAnswer((_) async => _getMovieListMock());
      moviesBloc = MoviesBloc(mockGetMovieListUC);
      await expectLater(moviesBloc.moviesResultState,
          emitsInOrder([isA<MoviesLoadingState>(), isA<MoviesSuccessState>()]));
      verify(mockGetMovieListUC.getFuture(params: null)).called(1);
    });

    test('it should thrown an exception', () async {
      when(mockGetMovieListUC.getFuture(params: null)).thenThrow(Exception());
      moviesBloc = MoviesBloc(mockGetMovieListUC);
      await expectLater(moviesBloc.moviesResultState,
          emitsInOrder([isA<MoviesLoadingState>(), isA<MoviesErrorState>()]));
      verify(mockGetMovieListUC.getFuture(params: null)).called(1);
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
