import 'package:teste_tokenlab/data/remote/movie/model/movie_details/details/movie_details_response.dart';
import 'package:teste_tokenlab/domain/movie_details/details/movie_details_model.dart';
import 'package:teste_tokenlab/domain/movie_details/production_company/production_company_model.dart';
import 'package:teste_tokenlab/extensions/string_extensions.dart';

extension MovieDetailsResponseExtensions on MovieDetailsResponse {
  MovieDetailsModel toMovieDetailsModel() => MovieDetailsModel(
      genres,
      originalTitle.isBlank() ? '-' : originalTitle,
      posterUrl,
      productionCompanies
              .map((item) => ProductionCompanyModel(
                  item.name.isBlank() ? '-' : item.name,
                  item.originCountry.isBlank() ? '-' : item.originCountry))
              .toList(),
      title.isBlank() ? '-' : title,
      voteAverage);
}
