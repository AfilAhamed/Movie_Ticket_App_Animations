import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/helpers/data.dart';
import 'package:movie_ticket_app/view/widgets/geners.dart';
import 'package:movie_ticket_app/view/widgets/star_rating.dart';

class MovieIndex extends StatelessWidget {
  MovieIndex({super.key, required this.index, required this.movieItemWidth});
  final int index;
  final double movieItemWidth;
  final movieData = MovieData();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: appPadding + 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.008,
          ),
          Container(
            height: size.height * 0.15,
            child: Align(
                alignment: Alignment.center,
                child:
                    Image(image: movieData.movieList![index].imageLogo.image)),
          ),
          GenresFormat(movieData.movieList![index].genre, white),
          SizedBox(
            height: size.height * 0.005,
          ),
          StarRating(movieData.movieList![index].rating),
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            width: size.width * 0.25,
            height: 1.0,
            color: secondary.withOpacity(0.5),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            width: size.width * 0.25,
            height: size.height * 0.05,
            decoration: BoxDecoration(
              color: secondary,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Center(
              child: Text(
                'Buy Ticket',
                style: TextStyle(color: white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image(
                fit: BoxFit.cover,
                height: size.height * 0.35,
                width: size.width * 0.5,
                image: movieData.movieList![index].image.image),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            movieData.movieList![index].name,
            style: TextStyle(
                color: white,
                fontSize: size.width / 14,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
