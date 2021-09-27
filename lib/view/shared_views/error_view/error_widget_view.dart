import 'package:flutter/material.dart';

class ErrorViewWidget extends StatelessWidget {
  const ErrorViewWidget({required this.function, Key? key}) : super(key: key);
  final Function() function;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: const Text('Ops'),
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
          const Text('Ocorreu um erro!', style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold
          )),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: function,
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all(Colors.red),
            ),
            child: const Text(
              'Tentar novamente',
              style:
              TextStyle(color: Colors.white, fontSize: 16),
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
