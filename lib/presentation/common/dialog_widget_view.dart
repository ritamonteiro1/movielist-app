import 'package:flutter/material.dart';
import 'package:teste_tokenlab/generated/l10n.dart';

class DialogWidgetView extends StatelessWidget {
  const DialogWidgetView({
    required this.description,
    Key? key,
  }) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(S.of(context).alertDialogTitle),
        content: Text(description),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).alertDialogButtonText),
          ),
        ],
      );
}
