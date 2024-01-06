import 'package:flutter/material.dart';

class MovieAnimationController extends ChangeNotifier {
  final double maxMovieTranslate = 65;

  double movieTranslate(double offset, double activeOffset,
      ScrollController movieScrollController, movieItemWidth) {
    double translate;
    if (movieScrollController.offset + movieItemWidth <= activeOffset) {
      translate = maxMovieTranslate;
    } else if (movieScrollController.offset <= activeOffset) {
      translate = maxMovieTranslate -
          ((movieScrollController.offset - (activeOffset - movieItemWidth)) /
              movieItemWidth *
              maxMovieTranslate);
    } else if (movieScrollController.offset < activeOffset + movieItemWidth) {
      translate =
          ((movieScrollController.offset - (activeOffset - movieItemWidth)) /
                  movieItemWidth *
                  maxMovieTranslate) -
              maxMovieTranslate;
    } else {
      translate = maxMovieTranslate;
    }
    return translate;
  }

  double movieDescriptionOpacity(double offset, double activeOffset,
      ScrollController movieScrollController, movieItemWidth) {
    double opacity;
    if (movieScrollController.offset + movieItemWidth <= activeOffset) {
      opacity = 0;
    } else if (movieScrollController.offset <= activeOffset) {
      opacity =
          ((movieScrollController.offset - (activeOffset - movieItemWidth)) /
              movieItemWidth *
              100);
    } else if (movieScrollController.offset < activeOffset + movieItemWidth) {
      opacity = 100 -
          (((movieScrollController.offset - (activeOffset - movieItemWidth)) /
                  movieItemWidth *
                  100) -
              100);
    } else {
      opacity = 0;
    }
    return opacity;
  }
}
