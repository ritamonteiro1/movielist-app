import 'package:flutter/material.dart';
import 'package:teste_tokenlab/constants/constants_images.dart';
import 'package:teste_tokenlab/domain/movies/movie_model.dart';
import 'package:teste_tokenlab/generated/l10n.dart';


class MovieListViewWidget extends StatelessWidget {
  const MovieListViewWidget({required this.movies, Key? key}) : super(key: key);
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: movies.length,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.only(
          left: 6, top: 3, right: 6, bottom: 3),
      child: Card(
        color: Colors.white,
        child: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: FadeInImage(
                height: 180,
                width: 100,
                image: NetworkImage(movies[index].imageUrl),
                placeholder:
                const AssetImage(ConstantsImages.imageLoading),
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.asset(ConstantsImages.imageError,
                        height: 180,
                        width: 100,
                        fit: BoxFit.fitWidth),
                fit: BoxFit.fitWidth,
              ),),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movies[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    movies[index].releaseDate,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        movies[index].voteAverage.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pushNamed(
                          'movie-details/${movies[index].id}'
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.red),
                      ),
                      child:  Text(
                        S.of(context).movieListViewButtonText,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
