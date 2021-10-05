// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  static String m0(quantity) =>
      "${Intl.plural(quantity, one: 'Genre:', other: 'Genres:')}";

  static String m1(quantity) =>
      "${Intl.plural(quantity, one: 'Production company:', other: 'Production companies:')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutEnterpriseViewAppBarTitle":
            MessageLookupByLibrary.simpleMessage("TokenLab"),
        "aboutEnterpriseViewText": MessageLookupByLibrary.simpleMessage(
            "We are a digital innovation company whose main purpose is to positively transform the world through technology."),
        "errorViewAppBarTitle": MessageLookupByLibrary.simpleMessage("Ops"),
        "errorViewButtonText":
            MessageLookupByLibrary.simpleMessage("Try again"),
        "errorViewText":
            MessageLookupByLibrary.simpleMessage("Occurred error!"),
        "loadingViewAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Loading..."),
        "mainContentViewBottomNavigationAboutEnterprise":
            MessageLookupByLibrary.simpleMessage("About enterprise"),
        "mainContentViewBottomNavigationMovies":
            MessageLookupByLibrary.simpleMessage("Movies"),
        "movieListViewButtonText":
            MessageLookupByLibrary.simpleMessage("SEE DETAILS"),
        "productionCompanyCountry":
            MessageLookupByLibrary.simpleMessage("Country:"),
        "productionCompanyListViewName":
            MessageLookupByLibrary.simpleMessage("Name:"),
        "successfullyRequestMovieDetailsViewAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Movie details"),
        "successfullyRequestMovieDetailsViewGenreText": m0,
        "successfullyRequestMovieDetailsViewProductionCompanies": m1,
        "successfullyRequestMovieDetailsViewTitleOriginText":
            MessageLookupByLibrary.simpleMessage("Origin title:"),
        "successfullyRequestMovieDetailsViewVoteAverageText":
            MessageLookupByLibrary.simpleMessage("Rating:"),
        "successfullyRequestMoviesViewAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Movie list")
      };
}
