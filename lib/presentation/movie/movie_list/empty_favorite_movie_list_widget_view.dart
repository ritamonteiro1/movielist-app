import 'package:flutter/material.dart';
import 'package:teste_tokenlab/generated/l10n.dart';

class EmptyFavoriteMovieListWidgetView extends StatelessWidget {
  const EmptyFavoriteMovieListWidgetView({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title:
              Text(S.of(context).errorAsyncSnapshotFavoriteMoviesTitleAppBar),
        ),
        body: Center(
          child: Text(
            S.of(context).errorAsyncSnapshotFavoriteMoviesBodyText,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
          ),
        ),
      );
}
