import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/view/details_screen/detail_screen.dart';
import '../../../helpers/data.dart';
import '../../widgets/geners.dart';
import '../../widgets/star_rating.dart';

class MovieIndex extends StatelessWidget {
  final int index;
  final ScrollController movieScrollController;
  final double movieItemWidth;

  MovieIndex(
      {super.key,
      required this.index,
      required this.movieScrollController,
      required this.movieItemWidth});

  final movieData = MovieData();

  final double maxMovieTranslate = 65;

  double _movieTranslate(double offset, double activeOffset) {
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

  double _movieDescriptionOpacity(double offset, double activeOffset) {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: appPadding + 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AnimatedBuilder(
            animation: movieScrollController,
            builder: (ctx, child) {
              double activeOffset = index * movieItemWidth;

              double translate =
                  _movieTranslate(movieScrollController.offset, activeOffset);

              return SizedBox(
                height: translate,
              );
            },
          ),
          SizedBox(
            height: size.height * .008,
          ),
          SizedBox(
            height: size.height * .15,
            child: Align(
              alignment: Alignment.center,
              child: Image(
                width: size.width / 2.5,
                image: movieData.movieList![index].imageLogo.image,
              ),
            ),
          ),
          GenresFormat(movieData.movieList![index].genre, white),
          SizedBox(
            height: size.height * .005,
          ),
          StarRating(movieData.movieList![index].rating),
          SizedBox(
            height: size.height * .01,
          ),
          Container(
            width: size.width * .25,
            height: 1,
            color: secondary.withOpacity(0.5),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailScreen()));
            },
            child: Container(
              width: size.width * .25,
              height: size.height * .05,
              decoration: BoxDecoration(
                  color: secondary, borderRadius: BorderRadius.circular(10.0)),
              child: const Center(
                  child: Text(
                'BUY TICKET',
                style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: movieData.movieList![index].image.image,
              width: size.width * 0.5,
              height: size.height * 0.35,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          AnimatedBuilder(
            animation: movieScrollController,
            builder: (context, child) {
              double activeOffset = index * movieItemWidth;
              double opacity = _movieDescriptionOpacity(
                  movieScrollController.offset, activeOffset);

              return Opacity(
                opacity: opacity / 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      movieData.movieList![index].name,
                      style: TextStyle(
                          color: white,
                          fontSize: size.width / 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
