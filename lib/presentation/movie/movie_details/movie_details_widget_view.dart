import 'package:domain/domain/model/movie_details/details/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:teste_tokenlab/constants/constants_images.dart';
import 'package:teste_tokenlab/generated/l10n.dart';
import 'package:teste_tokenlab/presentation/movie/movie_details/favorite_movie_result_state.dart';
import 'package:teste_tokenlab/presentation/movie/movie_details/genre_list_movie_details_widget_view.dart';
import 'package:teste_tokenlab/presentation/movie/movie_details/movie_details_bloc.dart';
import 'package:teste_tokenlab/presentation/movie/movie_details/production_company_list_movie_details_widget_view.dart';
import 'package:teste_tokenlab/presentation/common/dialog_widget_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class MovieDetailsWidgetView extends StatefulWidget {
  const MovieDetailsWidgetView({
    required this.movieDetails,
    required this.movieDetailsBloc,
    required this.analytics,
    Key? key,
  }) : super(key: key);
  final MovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;
  final FirebaseAnalytics analytics;

  @override
  _MovieDetailsWidgetViewState createState() => _MovieDetailsWidgetViewState();
}

class _MovieDetailsWidgetViewState extends State<MovieDetailsWidgetView> {
  @override
  void initState() {
    super.initState();
    widget.movieDetailsBloc.addOrRemoveResultState.listen((event) {
      if (event is SuccessAddFavoriteMovie) {
        _showDialog(S.of(context).alertDialogMessageSuccessAddMovie);
      } else if (event is SuccessRemoveFavoriteMovie) {
        _showDialog(S.of(context).alertDialogMessageSuccessRemoveMovie);
      } else {
        _handleErrorAddOrFavoriteMovie();
      }
    });
  }

  void _handleErrorAddOrFavoriteMovie() {
    if (widget.movieDetails.isFavorite) {
      _showDialog(S.of(context).alertDialogMessageErrorRemoveMovie);
    } else {
      _showDialog(S.of(context).alertDialogMessageErrorAddMovie);
    }
  }

  void _showDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => DialogWidgetView(description: message));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
              S.of(context).successfullyRequestMovieDetailsViewAppBarTitle),
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
                  Text(
                    widget.movieDetails.title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S
                          .of(context)
                          .successfullyRequestMovieDetailsViewToFavoriteMovie),
                      const SizedBox(
                        width: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.analytics.logEvent(
                              name: 'toggle_favorite_movie',
                              parameters: {
                                'isFavorite': widget.movieDetails.isFavorite
                              });
                          widget.movieDetailsBloc.onFavoriteMovieInput
                              .add(null);
                        },
                        child: Icon(Icons.star,
                            color: widget.movieDetails.isFavorite
                                ? Colors.yellow
                                : Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInImage(
                    height: 180,
                    width: 100,
                    image: NetworkImage(widget.movieDetails.posterUrl),
                    placeholder: const AssetImage(ConstantsImages.imageLoading),
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Image.asset(ConstantsImages.imageError,
                            height: 180, width: 100, fit: BoxFit.fitWidth),
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S
                            .of(context)
                            .successfullyRequestMovieDetailsViewVoteAverageText,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(widget.movieDetails.voteAverage.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    S
                        .of(context)
                        .successfullyRequestMovieDetailsViewTitleOriginText,
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(widget.movieDetails.originalTitle),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    S.of(context).successfullyRequestMovieDetailsViewGenreText(
                        widget.movieDetails.genres.length),
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GenreListMovieDetailsWidgetView(
                      genderListMovieDetails: widget.movieDetails.genres),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    S
                        .of(context)
                        .successfullyRequestMovieDetailsViewProductionCompanies(
                            widget.movieDetails.productionCompanies.length),
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ProductionCompanyListMovieDetailsWidgetView(
                      productionCompanyList:
                          widget.movieDetails.productionCompanies),
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
