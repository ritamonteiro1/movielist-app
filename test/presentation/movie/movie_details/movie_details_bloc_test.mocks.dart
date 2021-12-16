// Mocks generated by Mockito 5.0.15 from annotations
// in teste_tokenlab/test/presentation/movie/movie_details/movie_details_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:domain/domain/data_repository/movie_data_repository.dart'
    as _i2;
import 'package:domain/domain/model/movie_details/details/movie_details.dart'
    as _i3;
import 'package:domain/domain/use_case/add_favorite_movie_uc.dart' as _i6;
import 'package:domain/domain/use_case/get_movie_details_uc.dart' as _i4;
import 'package:domain/domain/use_case/remove_favorite_movie_uc.dart' as _i7;
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

class _FakeMovieDetails_1 extends _i1.Fake implements _i3.MovieDetails {}

/// A class which mocks [GetMovieDetailsUC].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieDetailsUC extends _i1.Mock implements _i4.GetMovieDetailsUC {
  MockGetMovieDetailsUC() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieDataRepository get movieDataRepository => (super.noSuchMethod(
      Invocation.getter(#movieDataRepository),
      returnValue: _FakeMovieDataRepository_0()) as _i2.MovieDataRepository);
  @override
  _i5.Future<_i3.MovieDetails> getRawFuture(
          {_i4.GetMovieDetailsUCParams? params}) =>
      (super.noSuchMethod(
              Invocation.method(#getRawFuture, [], {#params: params}),
              returnValue:
                  Future<_i3.MovieDetails>.value(_FakeMovieDetails_1()))
          as _i5.Future<_i3.MovieDetails>);
  @override
  _i5.Future<_i3.MovieDetails> getFuture(
          {_i4.GetMovieDetailsUCParams? params}) =>
      (super.noSuchMethod(Invocation.method(#getFuture, [], {#params: params}),
              returnValue:
                  Future<_i3.MovieDetails>.value(_FakeMovieDetails_1()))
          as _i5.Future<_i3.MovieDetails>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [AddFavoriteMovieUC].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddFavoriteMovieUC extends _i1.Mock
    implements _i6.AddFavoriteMovieUC {
  MockAddFavoriteMovieUC() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieDataRepository get movieDataRepository => (super.noSuchMethod(
      Invocation.getter(#movieDataRepository),
      returnValue: _FakeMovieDataRepository_0()) as _i2.MovieDataRepository);
  @override
  _i5.Future<void> getRawFuture({_i6.AddFavoriteMovieUCParams? params}) =>
      (super.noSuchMethod(
          Invocation.method(#getRawFuture, [], {#params: params}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> getFuture({_i6.AddFavoriteMovieUCParams? params}) =>
      (super.noSuchMethod(Invocation.method(#getFuture, [], {#params: params}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [RemoveFavoriteMovieUC].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveFavoriteMovieUC extends _i1.Mock
    implements _i7.RemoveFavoriteMovieUC {
  MockRemoveFavoriteMovieUC() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieDataRepository get movieDataRepository => (super.noSuchMethod(
      Invocation.getter(#movieDataRepository),
      returnValue: _FakeMovieDataRepository_0()) as _i2.MovieDataRepository);
  @override
  _i5.Future<void> getRawFuture({_i7.RemoveFavoriteMovieUCParams? params}) =>
      (super.noSuchMethod(
          Invocation.method(#getRawFuture, [], {#params: params}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> getFuture({_i7.RemoveFavoriteMovieUCParams? params}) =>
      (super.noSuchMethod(Invocation.method(#getFuture, [], {#params: params}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  String toString() => super.toString();
}