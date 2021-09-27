import 'package:flutter/material.dart';
import 'package:teste_tokenlab/constants/constants_images.dart';
import 'package:teste_tokenlab/domain/movie_details/details/movie_details_model.dart';
import 'package:teste_tokenlab/view/movie_details_view/widgets/genre_list_view_movie_details_widget.dart';
import 'package:teste_tokenlab/view/movie_details_view/widgets/production_company_list_view_movie_details_widget.dart';

class SuccessfullyRequestMovieDetails extends StatelessWidget {
  const SuccessfullyRequestMovieDetails({required this.movieDetails, Key? key})
      : super(key: key);
  final MovieDetailsModel movieDetails;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes do filme'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 6, top: 3, right: 6, bottom: 3),
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(movieDetails.title,
                      style: const TextStyle(fontSize: 20)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Classificação:',
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(movieDetails.voteAverage.toString()),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInImage(
                    height: 180,
                    width: 100,
                    image: NetworkImage(movieDetails.posterUrl),
                    placeholder: const AssetImage(ConstantsImages.imageLoading),
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Image.asset(ConstantsImages.imageError,
                            height: 180, width: 100, fit: BoxFit.fitWidth),
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Título original:',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(movieDetails.originalTitle),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Gênero:',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GenreListViewMovieDetailsWidget(
                      genderListMovieDetails: movieDetails.genres),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Empresas que produziram:',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ProductionCompanyListViewMovieDetailsWidget(
                      productionCompanyList: movieDetails.productionCompanies),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
