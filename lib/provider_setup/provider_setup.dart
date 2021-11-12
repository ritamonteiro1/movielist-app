import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:teste_tokenlab/data/cache_model/cache_data_source/movie_cache_data_source.dart';
import 'package:teste_tokenlab/data/remote/movie/remote_data_source/movie_remote_data_source.dart';
import 'package:teste_tokenlab/data/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/data/repository/movie_repository.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Dio()),
  Provider.value(value: MovieCacheDataSource())
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
];