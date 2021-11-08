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
        "alertDialogButtonText": MessageLookupByLibrary.simpleMessage("Ok"),
        "alertDialogMessageErrorAddMovie": MessageLookupByLibrary.simpleMessage(
            "Erro ao adicionar filme na lista de favoritos!"),
        "alertDialogMessageErrorRemoveMovie":
            MessageLookupByLibrary.simpleMessage(
                "Erro ao remover filme da lista de favoritos!"),
        "alertDialogMessageSuccessAddMovie":
            MessageLookupByLibrary.simpleMessage(
                "Filme adicionado na lista de favoritos!"),
        "alertDialogMessageSuccessRemoveMovie":
            MessageLookupByLibrary.simpleMessage(
                "Filme removido da lista de favoritos!"),
        "alertDialogTitle": MessageLookupByLibrary.simpleMessage("Messagem:"),
        "errorAsyncSnapshotFavoriteMoviesBodyText":
            MessageLookupByLibrary.simpleMessage("Sem filmes favoritos!"),
        "errorAsyncSnapshotFavoriteMoviesTitleAppBar":
            MessageLookupByLibrary.simpleMessage("Ops..."),
        "errorViewAppBarTitle": MessageLookupByLibrary.simpleMessage("Ops"),
        "errorViewButtonText":
            MessageLookupByLibrary.simpleMessage("Tentar novamente"),
        "errorViewText":
            MessageLookupByLibrary.simpleMessage("Ocorreu um erro!"),
        "favoriteMoviesViewAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Filmes favoritos"),
        "loadingViewAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Carregando..."),
        "mainContentViewBottomNavigationAboutEnterprise":
            MessageLookupByLibrary.simpleMessage("Sobre a empresa"),
        "mainContentViewBottomNavigationFavoriteMovies":
            MessageLookupByLibrary.simpleMessage("Favoritos"),
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
        "successfullyRequestMovieDetailsViewToFavoriteMovie":
            MessageLookupByLibrary.simpleMessage("Favoritar:"),
        "successfullyRequestMovieDetailsViewVoteAverageText":
            MessageLookupByLibrary.simpleMessage("Avaliação:"),
        "successfullyRequestMoviesViewAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Lista de filmes")
      };
}
