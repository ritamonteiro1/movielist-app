import 'package:teste_tokenlab/domain/movie_details/details/movie_details.dart';

abstract class MovieDetailsResultState {}

class MovieDetailsLoadingState implements MovieDetailsResultState {}

class MovieDetailsErrorState implements MovieDetailsResultState {}

class MovieDetailsSuccessState implements MovieDetailsResultState {
  MovieDetailsSuccessState(this.movieDetails);
  final MovieDetails movieDetails;
}
