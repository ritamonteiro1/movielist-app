import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies/movie_cm.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies_details/details/movie_details_cm.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies_details/production_company/production_company_cm.dart';
import 'package:teste_tokenlab/view/main_content_view/main_content_view.dart';
import 'package:teste_tokenlab/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teste_tokenlab/view/movie_details_view/movie_details_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

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
      'movie-details/:movieId',
      handler: Handler(
        handlerFunc: (context, params) {
          final movieId = int.parse(params['movieId']![0]);
          return MovieDetailsScreen(movieId: movieId);
        },
      ),
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
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
      );
}
