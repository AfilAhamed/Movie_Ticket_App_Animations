import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/helpers/data.dart';

class BackgroundListView extends StatelessWidget {
  BackgroundListView({super.key, required this.backgroundScrollController});

  final ScrollController backgroundScrollController;

  final movieData = MovieData();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        controller: backgroundScrollController,
        reverse: true,
        padding: EdgeInsets.zero,
        itemCount: movieData.movieList!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Positioned(
                  left: -size.width / 3.8,
                  right: -size.width / 3.8,
                  child: Image(
                    image: movieData.movieList![index].image.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: black.withOpacity(0.4),
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            black.withOpacity(0.3),
                            black.withOpacity(0.95),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.5, 0.9])),
                )
              ],
            ),
          );
        });
  }
}
