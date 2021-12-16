import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:teste_tokenlab/data/remote/movie/model/movie_details/details/movie_details_rm.dart';
import 'package:teste_tokenlab/data/remote/movie/model/movie_details/production_company/production_company_rm.dart';
import 'package:teste_tokenlab/data/remote/movie/model/movies/movie_rm.dart';
import 'package:teste_tokenlab/data/remote/movie/remote_data_source/movie_remote_data_source.dart';

import '../../../utils/json_extensions.dart';
import 'movie_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late MovieRemoteDataSource movieRemoteDataSource;
  const baseUrl = 'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';
  const movieDetailsSuccessResponsePath =
      'test_resources/movie_details_success_response.json';
  const movieListSuccessResponsePath =
      'test_resources/movie_list_success_response.json';
  setUpAll(() {
    mockDio = MockDio();
    movieRemoteDataSource = MovieRemoteDataSource(mockDio);
  });
  setUp(() {
    reset(mockDio);
  });
  group('fetchMovieDetails', () {
    const movieId = 2;
    test('verify movie details base url', () async {
      final json = await movieDetailsSuccessResponsePath.getJsonFromPath();
      when(mockDio.get(any)).thenAnswer(
        (_) async => _getResponseMock(json),
      );
      await movieRemoteDataSource.fetchMovieDetails(movieId);
      verify(mockDio.get('$baseUrl${'/$movieId'}')).called(1);
    });
    test('it should return a movie details', () async {
      final json = await movieDetailsSuccessResponsePath.getJsonFromPath();
      when(mockDio.get(any)).thenAnswer((_) async => _getResponseMock(json));
      final movieDetails =
          await movieRemoteDataSource.fetchMovieDetails(movieId);
      final movieDetailsExpected = _getMovieDetailsRMMock();
      expect(movieDetails, equals(movieDetailsExpected));
    });
    test('it should throw an exception', () async {
      when(mockDio.get(any)).thenThrow(Exception());
      expect(() => movieRemoteDataSource.fetchMovieDetails(movieId),
          throwsException);
    });
  });

  group('fetchMovieList', () {
    test('verify movie list base url', () async {
      final json = await movieListSuccessResponsePath.getJsonFromPath();
      when(mockDio.get(any)).thenAnswer((_) async => _getResponseMock(json));
      await movieRemoteDataSource.fetchMovieList();
      verify(mockDio.get(baseUrl)).called(1);
    });
    test('it should return a movie list', () async {
      final json = await movieListSuccessResponsePath.getJsonFromPath();
      when(mockDio.get(any)).thenAnswer((_) async => _getResponseMock(json));
      final movieList = await movieRemoteDataSource.fetchMovieList();
      final movieListExpected = _getMovieListRMMock();
      expect(movieList, equals(movieListExpected));
    });
    test('it should throw an exception', () async {
      when(mockDio.get(any)).thenThrow(Exception());
      expect(() => movieRemoteDataSource.fetchMovieList(), throwsException);
    });
  });
}

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

Response<dynamic> _getResponseMock(json) => Response(
      data: json,
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );
