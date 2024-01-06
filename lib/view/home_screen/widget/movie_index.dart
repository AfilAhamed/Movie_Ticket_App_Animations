import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/controller/animation_controller.dart';
import 'package:movie_ticket_app/view/details_screen/detail_screen.dart';
import 'package:provider/provider.dart';
import '../../../services/data.dart';
import '../../widgets/geners.dart';
import '../../widgets/star_rating.dart';

class MovieIndex extends StatelessWidget {
  final int index;
  final ScrollController movieScrollController;
  final double movieItemWidth;

  const MovieIndex(
      {super.key,
      required this.index,
      required this.movieScrollController,
      required this.movieItemWidth});

  // final movieData = MovieData();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieAnimationController>(context);
    Size size = MediaQuery.of(context).size;
    final movieData = MovieData(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: appPadding + 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AnimatedBuilder(
            animation: movieScrollController,
            builder: (ctx, child) {
              double activeOffset = index * movieItemWidth;

              double translate = provider.movieTranslate(
                  movieScrollController.offset,
                  activeOffset,
                  movieScrollController,
                  movieItemWidth);

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            movie: movieData.movieList![index],
                            size: size,
                          )));
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            movie: movieData.movieList![index],
                            size: size,
                          )));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: movieData.movieList![index].image.image,
                width: size.width * 0.5,
                height: size.height * 0.35,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          AnimatedBuilder(
            animation: movieScrollController,
            builder: (context, child) {
              double activeOffset = index * movieItemWidth;
              double opacity = provider.movieDescriptionOpacity(
                  movieScrollController.offset,
                  activeOffset,
                  movieScrollController,
                  movieItemWidth);

              return Opacity(
                opacity: opacity / 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      overflow: TextOverflow.ellipsis,
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
