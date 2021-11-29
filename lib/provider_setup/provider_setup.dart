import 'package:dio/dio.dart';
import 'package:domain/domain/data_repository/movie_data_repository.dart';
import 'package:domain/domain/use_case/add_favorite_movie_uc.dart';
import 'package:domain/domain/use_case/get_favorite_movie_list_uc.dart';
import 'package:domain/domain/use_case/get_movie_details_uc.dart';
import 'package:domain/domain/use_case/get_movie_list_uc.dart';
import 'package:domain/domain/use_case/remove_favorite_movie_uc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:teste_tokenlab/data/cache_model/cache_data_source/movie_cache_data_source.dart';
import 'package:teste_tokenlab/data/remote/movie/remote_data_source/movie_remote_data_source.dart';
import 'package:teste_tokenlab/data/repository/movie_repository.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Dio()),
  Provider.value(value: MovieCacheDataSource()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Dio, MovieRemoteDataSource>(
    update: (_, dio, __) => MovieRemoteDataSource(dio),
  ),
  ProxyProvider2<MovieRemoteDataSource, MovieCacheDataSource,
      MovieDataRepository>(
    update: (_, movieRemoteDataSource, movieCacheDataSource, __) =>
        MovieRepository(movieRemoteDataSource, movieCacheDataSource),
  ),
  ProxyProvider<MovieDataRepository, GetMovieListUC>(
    update: (_, movieDataRepository, __) => GetMovieListUC(movieDataRepository),
  ),
  ProxyProvider<MovieDataRepository, GetMovieDetailsUC>(
    update: (_, movieDataRepository, __) =>
        GetMovieDetailsUC(movieDataRepository),
  ),
  ProxyProvider<MovieDataRepository, AddFavoriteMovieUC>(
    update: (_, movieDataRepository, __) =>
        AddFavoriteMovieUC(movieDataRepository),
  ),
  ProxyProvider<MovieDataRepository, RemoveFavoriteMovieUC>(
    update: (_, movieDataRepository, __) =>
        RemoveFavoriteMovieUC(movieDataRepository),
  ),
  ProxyProvider<MovieDataRepository, GetFavoriteMovieListUC>(
    update: (_, movieDataRepository, __) =>
        GetFavoriteMovieListUC(movieDataRepository),
  ),
];
