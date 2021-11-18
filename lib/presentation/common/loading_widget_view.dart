import 'package:flutter/material.dart';
import 'package:teste_tokenlab/generated/l10n.dart';

class LoadingWidgetView extends StatelessWidget {
  const LoadingWidgetView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(S.of(context).loadingViewAppBarTitle),
          backgroundColor: Colors.blue,
          elevation: 8,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
}
