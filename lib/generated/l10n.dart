// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Movie list`
  String get successfullyRequestMoviesViewAppBarTitle {
    return Intl.message(
      'Movie list',
      name: 'successfullyRequestMoviesViewAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `SEE DETAILS`
  String get movieListViewButtonText {
    return Intl.message(
      'SEE DETAILS',
      name: 'movieListViewButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Movies`
  String get mainContentViewBottomNavigationMovies {
    return Intl.message(
      'Movies',
      name: 'mainContentViewBottomNavigationMovies',
      desc: '',
      args: [],
    );
  }

  /// `About enterprise`
  String get mainContentViewBottomNavigationAboutEnterprise {
    return Intl.message(
      'About enterprise',
      name: 'mainContentViewBottomNavigationAboutEnterprise',
      desc: '',
      args: [],
    );
  }

  /// `TokenLab`
  String get aboutEnterpriseViewAppBarTitle {
    return Intl.message(
      'TokenLab',
      name: 'aboutEnterpriseViewAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `We are a digital innovation company whose main purpose is to positively transform the world through technology.`
  String get aboutEnterpriseViewText {
    return Intl.message(
      'We are a digital innovation company whose main purpose is to positively transform the world through technology.',
      name: 'aboutEnterpriseViewText',
      desc: '',
      args: [],
    );
  }

  /// `Ops`
  String get errorViewAppBarTitle {
    return Intl.message(
      'Ops',
      name: 'errorViewAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Occurred error!`
  String get errorViewText {
    return Intl.message(
      'Occurred error!',
      name: 'errorViewText',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get errorViewButtonText {
    return Intl.message(
      'Try again',
      name: 'errorViewButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loadingViewAppBarTitle {
    return Intl.message(
      'Loading...',
      name: 'loadingViewAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Movie details`
  String get successfullyRequestMovieDetailsViewAppBarTitle {
    return Intl.message(
      'Movie details',
      name: 'successfullyRequestMovieDetailsViewAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Rating:`
  String get successfullyRequestMovieDetailsViewVoteAverageText {
    return Intl.message(
      'Rating:',
      name: 'successfullyRequestMovieDetailsViewVoteAverageText',
      desc: '',
      args: [],
    );
  }

  /// `Origin title:`
  String get successfullyRequestMovieDetailsViewTitleOriginText {
    return Intl.message(
      'Origin title:',
      name: 'successfullyRequestMovieDetailsViewTitleOriginText',
      desc: '',
      args: [],
    );
  }

  /// `{quantity, plural, one{Genre:} other{Genres:}}`
  String successfullyRequestMovieDetailsViewGenreText(num quantity) {
    return Intl.plural(
      quantity,
      one: 'Genre:',
      other: 'Genres:',
      name: 'successfullyRequestMovieDetailsViewGenreText',
      desc: '',
      args: [quantity],
    );
  }

  /// `{quantity, plural, one{Production company:} other{Production companies:}}`
  String successfullyRequestMovieDetailsViewProductionCompanies(num quantity) {
    return Intl.plural(
      quantity,
      one: 'Production company:',
      other: 'Production companies:',
      name: 'successfullyRequestMovieDetailsViewProductionCompanies',
      desc: '',
      args: [quantity],
    );
  }

  /// `Name:`
  String get productionCompanyListViewName {
    return Intl.message(
      'Name:',
      name: 'productionCompanyListViewName',
      desc: '',
      args: [],
    );
  }

  /// `Country:`
  String get productionCompanyCountry {
    return Intl.message(
      'Country:',
      name: 'productionCompanyCountry',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
