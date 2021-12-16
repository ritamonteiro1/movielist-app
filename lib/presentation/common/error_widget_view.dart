import 'package:flutter/material.dart';
import 'package:teste_tokenlab/generated/l10n.dart';

class ErrorWidgetView extends StatelessWidget {
  const ErrorWidgetView({
    required this.function,
    required Key key,
  }) : super(key: key);
  final Function() function;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(S.of(context).errorViewAppBarTitle),
          elevation: 8,
          backgroundColor: Colors.blue,
        ),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(S.of(context).errorViewText,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: function,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: Text(
                  S.of(context).errorViewButtonText,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      );
}
