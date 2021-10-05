import 'package:flutter/material.dart';
import 'package:teste_tokenlab/generated/l10n.dart';

class AboutEnterpriseView extends StatelessWidget {
  const AboutEnterpriseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar:
            AppBar(title: Text(S.of(context).aboutEnterpriseViewAppBarTitle)),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text(
              S.of(context).aboutEnterpriseViewText,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}
