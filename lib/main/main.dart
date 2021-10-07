import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:teste_tokenlab/view/main_content_view/main_content_view.dart';
import 'package:teste_tokenlab/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teste_tokenlab/view/movie_details_view/movie_details_view.dart';


void main() {
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
          return MovieDetailsView(movieId: movieId);
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
