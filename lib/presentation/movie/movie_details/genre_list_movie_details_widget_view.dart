import 'package:flutter/material.dart';

class GenreListMovieDetailsWidgetView extends StatelessWidget {
  const GenreListMovieDetailsWidgetView({
    required this.genderListMovieDetails,
    Key? key,
  }) : super(key: key);
  final List<String> genderListMovieDetails;

  @override
  Widget build(BuildContext context) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: genderListMovieDetails.length,
        itemBuilder: (context, index) => Container(
            child: Center(child: Text(genderListMovieDetails[index]))),
      );
}
