import 'dart:ffi';

import 'package:domain/domain/model/movie_details/details/movie_details.dart';
import 'package:domain/domain/model/movie_details/production_company/production_company.dart';
import 'package:domain/domain/model/movies/movie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:teste_tokenlab/data/cache_model/cache_data_source/movie_cache_data_source.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies/movie_cm.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies_details/details/movie_details_cm.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies_details/production_company/production_company_cm.dart';
import 'package:teste_tokenlab/data/remote/movie/model/movie_details/details/movie_details_rm.dart';
import 'package:teste_tokenlab/data/remote/movie/model/movie_details/production_company/production_company_rm.dart';
import 'package:teste_tokenlab/data/remote/movie/model/movies/movie_rm.dart';
import 'package:teste_tokenlab/data/remote/movie/remote_data_source/movie_remote_data_source.dart';
import 'package:teste_tokenlab/data/repository/movie_repository.dart';

import 'movie_repository_test.mocks.dart';

@GenerateMocks([MovieRemoteDataSource, MovieCacheDataSource])
void main() {
  late MockMovieRemoteDataSource mockMovieRemoteDataSource;
  late MockMovieCacheDataSource mockMovieCacheDataSource;
  late MovieRepository movieRepository;
  const movieId = 2;
  setUpAll(() {
    mockMovieRemoteDataSource = MockMovieRemoteDataSource();
    mockMovieCacheDataSource = MockMovieCacheDataSource();
    movieRepository =
        MovieRepository(mockMovieRemoteDataSource, mockMovieCacheDataSource);
  });
  setUp(() {
    reset(mockMovieRemoteDataSource);
    reset(mockMovieCacheDataSource);
  });
  group('fetchMovieDetails', () {
    test('it should return a movie details', () async {
      when(mockMovieRemoteDataSource.fetchMovieDetails(movieId)).thenAnswer(
        (_) async => _getMovieDetailsRMMock(),
      );
      when(mockMovieCacheDataSource.getMovieDetails(movieId)).thenAnswer(
        (_) async => _getMovieDetailsCMMock(),
      );
      when(mockMovieCacheDataSource.getFavoriteMovieIdList()).thenAnswer(
        (_) async => _favoriteMovieRandomIdListMock(),
      );
      final movieDetails = await movieRepository.fetchMovieDetails(movieId);
      await expectLater(
        movieDetails,
        equals(
          _getMovieDetailsMock(),
        ),
      );
      verify(mockMovieRemoteDataSource.fetchMovieDetails(movieId)).called(1);
      verify(mockMovieCacheDataSource.getMovieDetails(movieId)).called(1);
      verify(mockMovieCacheDataSource.getFavoriteMovieIdList()).called(1);
    });
    test('it should throw an exception', () async {
      when(mockMovieRemoteDataSource.fetchMovieDetails(movieId))
          .thenThrow(Exception());
      when(mockMovieCacheDataSource.getMovieDetails(movieId))
          .thenThrow(Exception());
      when(mockMovieCacheDataSource.getFavoriteMovieIdList())
          .thenThrow(Exception());
      expect(() => movieRepository.fetchMovieDetails(movieId), throwsException);
    });
  });
  group('fetchMovieList', () {
    test('it should return a movie list', () async {
      when(mockMovieRemoteDataSource.fetchMovieList())
          .thenAnswer((_) async => _getMovieListRMMock());
      when(mockMovieCacheDataSource.getMovieList())
          .thenAnswer((_) async => _getMovieListCMMock());
      when(mockMovieCacheDataSource.saveMovieList(_getMovieListCMMock()))
          .thenAnswer((_) async => Void);
      await movieRepository.fetchMovieList();
      verify(mockMovieRemoteDataSource.fetchMovieList()).called(1);
      verify(mockMovieCacheDataSource.getMovieList()).called(1);
      verify(mockMovieCacheDataSource.saveMovieList(_getMovieListCMMock()))
          .called(1);
      final movieList = await movieRepository.fetchMovieList();
      await expectLater(
        movieList,
        equals(_getMovieListMock()),
      );
    });
    test('it should throw an exception', () async {
      when(mockMovieRemoteDataSource.fetchMovieList()).thenThrow(Exception());
      when(mockMovieCacheDataSource.getMovieList()).thenThrow(Exception());
      expect(() => movieRepository.fetchMovieList(), throwsException);
    });
  });
  group('fetchFavoriteMovies', () {
    test('it should a favorites movie list', () async {
      when(mockMovieCacheDataSource.getFavoriteMovieIdList()).thenAnswer(
        (_) async => _getFavoriteMovieIdListMock(),
      );
      when(mockMovieCacheDataSource.getMovieList())
          .thenAnswer((_) async => _getMovieListCMMock());
      final favoritesMovieList = await movieRepository.fetchFavoriteMovies();
      expect(
        favoritesMovieList,
        equals(
          _getMovieListMock(),
        ),
      );
      verify(mockMovieCacheDataSource.getFavoriteMovieIdList()).called(1);
      verify(mockMovieCacheDataSource.getMovieList()).called(1);
    });
    test('it should throw an exception', () async {
      when(mockMovieCacheDataSource.getMovieList()).thenThrow(Exception());
      when(mockMovieCacheDataSource.getFavoriteMovieIdList())
          .thenThrow(Exception());
      expect(() => movieRepository.fetchFavoriteMovies(), throwsException);
    });
  });
  group('addFavoriteMovie', () {
    test('verify add favorite movie is called', () async {
      when(mockMovieCacheDataSource.addFavoriteMovieId(movieId)).thenAnswer(
        (_) async => _,
      );
      await movieRepository.addFavoriteMovie(movieId);
      verify(mockMovieCacheDataSource.addFavoriteMovieId(movieId)).called(1);
    });
    test('it should throw an exception', () async {
      when(mockMovieCacheDataSource.addFavoriteMovieId(movieId))
          .thenThrow(Exception());
      expect(() => movieRepository.addFavoriteMovie(movieId), throwsException);
      verify(mockMovieCacheDataSource.addFavoriteMovieId(movieId)).called(1);
    });
  });
  group('removeFavoriteMovie', () {
    test('verify remove favorite movie is called', () async {
      when(mockMovieCacheDataSource.removeFavoriteMovieId(movieId)).thenAnswer(
        (_) async => _,
      );
      await movieRepository.removeFavoriteMovie(movieId);
      verify(mockMovieCacheDataSource.removeFavoriteMovieId(movieId)).called(1);
    });
    test('it should throw an exception', () async {
      when(mockMovieCacheDataSource.removeFavoriteMovieId(movieId))
          .thenThrow(Exception());
      expect(
          () => movieRepository.removeFavoriteMovie(movieId), throwsException);
      verify(mockMovieCacheDataSource.removeFavoriteMovieId(movieId)).called(1);
    });
  });
}

List<int> _favoriteMovieRandomIdListMock() => <int>[1, 2, 3];

List<int> _getFavoriteMovieIdListMock() => <int>[19404, 278];

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

List<MovieCM> _getMovieListCMMock() => <MovieCM>[
      MovieCM(
        19404,
        9.3,
        'Dilwale Dulhania Le Jayenge',
        'https://image.tmdb.org/t/p/w200/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg',
        '1995-10-20',
      ),
      MovieCM(
        278,
        8.6,
        'The Shawshank Redemption',
        'https://image.tmdb.org/t/p/w200/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg',
        '1994-09-23',
      ),
    ];

List<MovieRM> _getMovieListRMMock() => <MovieRM>[
      const MovieRM(
        19404,
        9.3,
        'Dilwale Dulhania Le Jayenge',
        'https://image.tmdb.org/t/p/w200/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg',
        '1995-10-20',
      ),
      const MovieRM(
        278,
        8.6,
        'The Shawshank Redemption',
        'https://image.tmdb.org/t/p/w200/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg',
        '1994-09-23',
      ),
    ];

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
    240);

MovieDetailsCM _getMovieDetailsCMMock() => const MovieDetailsCM(
    <String>['Drama', 'Crime'],
    'The Godfather: Part II',
    'https://image.tmdb.org/t/p/w200/bVq65huQ8vHDd1a4Z37QtuyEvpA.jpg',
    <ProductionCompanyCM>[
      ProductionCompanyCM('Paramount', 'US'),
      ProductionCompanyCM('The Coppola Company', '')
    ],
    'The Godfather: Part II',
    8.5,
    240);

MovieDetailsRM _getMovieDetailsRMMock() => const MovieDetailsRM(
    <String>['Drama', 'Crime'],
    'The Godfather: Part II',
    'https://image.tmdb.org/t/p/w200/bVq65huQ8vHDd1a4Z37QtuyEvpA.jpg',
    <ProductionCompanyRM>[
      ProductionCompanyRM('Paramount', 'US'),
      ProductionCompanyRM('The Coppola Company', '')
    ],
    'The Godfather: Part II',
    8.5,
    240);
