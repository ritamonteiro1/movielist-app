import 'package:flutter/material.dart';
import 'package:teste_tokenlab/view/movies_view/movies_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const MoviesView(),
      );
}
