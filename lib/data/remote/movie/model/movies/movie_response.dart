
class MovieResponse {
  MovieResponse(this.id, this.voteAverage, this.title, this.posterUrl,
      this.releaseDate);

  MovieResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteAverage = json['vote_average'];
    title = json['title'];
    posterUrl = json['poster_url'];
    releaseDate = json['release_date'];
  }

  late final int? id;
  late final double? voteAverage;
  late final String? title;
  late final String? posterUrl;
  late final String? releaseDate;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['vote_average'] = voteAverage;
    data['title'] = title;
    data['poster_url'] = posterUrl;
    data['release_date'] = releaseDate;
    return data;
  }
}