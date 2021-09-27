import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: const Text('Carregando...'),
      backgroundColor: Colors.blue,
      elevation: 8,
    ),
    body: const Center(
      child: CircularProgressIndicator(),
    ),
  );
}
