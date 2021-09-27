
import 'package:teste_tokenlab/data/remote/movie/model/movie_details/production_company/production_company_response.dart';

class MovieDetailsResponse {
  MovieDetailsResponse(
      this.genres,
      this.originalTitle,
      this.posterUrl,
      this.productionCompanies,
      this.title,
      this.voteAverage);

  MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    genres = json['genres'].cast<String>();
    originalTitle = json['original_title'];
    posterUrl = json['poster_url'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompanyResponse>[];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanyResponse.fromJson(v));
      });
    }
    title = json['title'];
    voteAverage = json['vote_average'];
  }

  late final List<String>? genres;
  late final String? originalTitle;
  late final String? posterUrl;
  late final List<ProductionCompanyResponse>? productionCompanies;
  late final String? title;
  late final double? voteAverage;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['genres'] = genres;
    data['original_title'] = originalTitle;
    data['poster_url'] = posterUrl;
    if (productionCompanies != null) {
      data['production_companies'] =
          productionCompanies?.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['vote_average'] = voteAverage;
    return data;
  }
}
