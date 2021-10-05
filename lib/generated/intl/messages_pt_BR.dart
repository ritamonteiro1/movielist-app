// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
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
  String get localeName => 'pt_BR';

  static String m0(quantity) =>
      "${Intl.plural(quantity, one: 'Gênero:', other: 'Gêneros:')}";

  static String m1(quantity) =>
      "${Intl.plural(quantity, one: 'Empresa que produziu:', other: 'Empresas que produziram:')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutEnterpriseViewAppBarTitle":
            MessageLookupByLibrary.simpleMessage("TokenLab"),
        "aboutEnterpriseViewText": MessageLookupByLibrary.simpleMessage(
            "Somos uma empresa de inovação digital que tem como principal propósito transformar positivamente o mundo através da tecnologia. "),
        "errorViewAppBarTitle": MessageLookupByLibrary.simpleMessage("Ops"),
        "errorViewButtonText":
            MessageLookupByLibrary.simpleMessage("Tentar novamente"),
        "errorViewText":
            MessageLookupByLibrary.simpleMessage("Ocorreu um erro!"),
        "loadingViewAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Carregando..."),
        "mainContentViewBottomNavigationAboutEnterprise":
            MessageLookupByLibrary.simpleMessage("Sobre a empresa"),
        "mainContentViewBottomNavigationMovies":
            MessageLookupByLibrary.simpleMessage("Filmes"),
        "movieListViewButtonText":
            MessageLookupByLibrary.simpleMessage("VER DETALHES"),
        "productionCompanyCountry":
            MessageLookupByLibrary.simpleMessage("País:"),
        "productionCompanyListViewName":
            MessageLookupByLibrary.simpleMessage("Nome:"),
        "successfullyRequestMovieDetailsViewAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Detalhes do filme"),
        "successfullyRequestMovieDetailsViewGenreText": m0,
        "successfullyRequestMovieDetailsViewProductionCompanies": m1,
        "successfullyRequestMovieDetailsViewTitleOriginText":
            MessageLookupByLibrary.simpleMessage("Título original:"),
        "successfullyRequestMovieDetailsViewVoteAverageText":
            MessageLookupByLibrary.simpleMessage("Avaliação:"),
        "successfullyRequestMoviesViewAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Lista de filmes")
      };
}
