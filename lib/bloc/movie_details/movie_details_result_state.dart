import 'package:teste_tokenlab/domain/movie_details/details/movie_details_model.dart';

abstract class MovieDetailsResultState {}

class MovieDetailsLoadingState extends MovieDetailsResultState {}

class MovieDetailsErrorState extends MovieDetailsResultState {}

class MovieDetailsSuccessState extends MovieDetailsResultState {
  MovieDetailsSuccessState(this.movieDetails);
  final MovieDetailsModel movieDetails;
}
