import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part 'movie_cm.g.dart';

@HiveType(typeId: 0)
class MovieCM extends Equatable {
  MovieCM(
      this.id, this.voteAverage, this.title, this.posterUrl, this.releaseDate);

  @HiveField(0)
  final int id;
  @HiveField(1)
  final double voteAverage;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String posterUrl;
  @HiveField(4)
  final String releaseDate;

  @override
  List<Object?> get props => [
        id,
        voteAverage,
        title,
        posterUrl,
        releaseDate,
      ];
}
