import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../../../helpers/data.dart';
import 'movie_index.dart';

class MovieListView extends StatelessWidget {
  final ScrollController movieScrollController;
  final double movieItemWidth;

  const MovieListView(
      {super.key,
      required this.movieScrollController,
      required this.movieItemWidth});

  @override
  Widget build(BuildContext context) {
    final movieData = MovieData(context);

    Size size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 700),
      tween: Tween<double>(begin: 600, end: 0),
      curve: Curves.easeOutCubic,
      builder: (_, value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: child,
        );
      },
      child: Container(
        height: size.height * .8,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: ScrollSnapList(
            listController: movieScrollController,
            onItemFocus: (item) {},
            itemSize: movieItemWidth,
            padding: EdgeInsets.zero,
            itemCount: movieData.movieList!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MovieIndex(
                  index: index,
                  movieScrollController: movieScrollController,
                  movieItemWidth: movieItemWidth);
            },
          ),
        ),
      ),
    );
  }
}
