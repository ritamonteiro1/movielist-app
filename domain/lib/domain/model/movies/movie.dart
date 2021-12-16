import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  const Movie(
    this.id,
    this.voteAverage,
    this.title,
    this.imageUrl,
    this.releaseDate,
  );

  final int id;
  final double voteAverage;
  final String title;
  final String imageUrl;
  final String releaseDate;

  @override
  List<Object?> get props => [
        id,
        voteAverage,
        title,
        imageUrl,
        releaseDate,
      ];
}
