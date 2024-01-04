import 'package:flutter/material.dart';
import 'package:movie_ticket_app/helpers/data.dart';
import 'package:movie_ticket_app/view/home_screen/widget/movie_index.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class MovieListView extends StatelessWidget {
  MovieListView(
      {super.key,
      required this.movieItemWidth,
      required this.movieScrollController});
  final double movieItemWidth;
  final ScrollController movieScrollController;
  final movieData = MovieData();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.8,
      child: ScrollSnapList(
        itemCount: movieData.movieList!.length,
        itemSize: movieItemWidth,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        onItemFocus: (item) {},
        itemBuilder: (context, index) {
          return MovieIndex(index: index, movieItemWidth: movieItemWidth);
        },
      ),
    );
  }
}
