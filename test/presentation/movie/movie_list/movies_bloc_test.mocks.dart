// Mocks generated by Mockito 5.0.15 from annotations
// in teste_tokenlab/test/presentation/movie/movie_list/movies_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:domain/domain/data_repository/movie_data_repository.dart'
    as _i2;
import 'package:domain/domain/model/movies/movie.dart' as _i5;
import 'package:domain/domain/use_case/get_movie_list_uc.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeMovieDataRepository_0 extends _i1.Fake
    implements _i2.MovieDataRepository {}

/// A class which mocks [GetMovieListUC].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieListUC extends _i1.Mock implements _i3.GetMovieListUC {
  MockGetMovieListUC() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieDataRepository get movieDataRepository => (super.noSuchMethod(
      Invocation.getter(#movieDataRepository),
      returnValue: _FakeMovieDataRepository_0()) as _i2.MovieDataRepository);
  @override
  _i4.Future<List<_i5.Movie>> getRawFuture({Null? params}) => (super
          .noSuchMethod(Invocation.method(#getRawFuture, [], {#params: params}),
              returnValue: Future<List<_i5.Movie>>.value(<_i5.Movie>[]))
      as _i4.Future<List<_i5.Movie>>);
  @override
  _i4.Future<List<_i5.Movie>> getFuture({Null? params}) =>
      (super.noSuchMethod(Invocation.method(#getFuture, [], {#params: params}),
              returnValue: Future<List<_i5.Movie>>.value(<_i5.Movie>[]))
          as _i4.Future<List<_i5.Movie>>);
  @override
  String toString() => super.toString();
}