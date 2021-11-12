import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies/movie_cm.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies_details/details/movie_details_cm.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies_details/production_company/production_company_cm.dart';
import 'package:teste_tokenlab/provider_setup/provider_setup.dart';
import 'package:teste_tokenlab/view/main_content_view/main_content_view.dart';
import 'package:teste_tokenlab/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teste_tokenlab/view/movie_details_view/movie_details_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:teste_tokenlab/view/movies_view/movies_screen.dart';
import 'package:teste_tokenlab/view/movies_view/widgets/about_enterprise_screen.dart';
import 'package:teste_tokenlab/view/movies_view/widgets/favorite_movies_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive
    ..init((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter<MovieCM>(MovieCMAdapter())
    ..registerAdapter<MovieDetailsCM>(MovieDetailsCMAdapter())
    ..registerAdapter<ProductionCompanyCM>(ProductionCompanyCMAdapter());

  FluroRouter.appRouter
    ..define(
      '/',
      handler: Handler(
        handlerFunc: (context, params) => const MainContentView(),
      ),
    )
    ..define(
      'movies',
      handler: Handler(
        handlerFunc: (context, params) => MoviesScreen.create(context!),
      ),
    )
    ..define(
      'about-enterprise',
      handler: Handler(
        handlerFunc: (context, params) => const AboutEnterpriseScreen(),
      ),
    )
    ..define(
      'favorites-movie',
      handler: Handler(
        handlerFunc: (context, params) => FavoriteMoviesScreen.create(context!),
      ),
    )
    ..define(
      'movie-details/:movieId',
      handler: Handler(
        handlerFunc: (context, params) {
          final movieId = int.parse(params['movieId']![0]);
          return MovieDetailsScreen.create(context!, movieId);
        },
      ),
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: (settings) => FluroRouter.appRouter
              .matchRoute(context, settings.name, routeSettings: settings)
              .route,
        ),
      );
}
