import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/model/movie_model.dart';
import 'package:movie_ticket_app/view/widgets/geners.dart';
import 'package:movie_ticket_app/view/widgets/star_rating.dart';
import 'package:rubber/rubber.dart';

class DetailSheet extends StatelessWidget {
  const DetailSheet(
      {super.key,
      required this.movie,
      required this.rubberSheetScrollController,
      required this.rubberAnimationController});
  final MovieModel movie;
  final ScrollController rubberSheetScrollController;
  final RubberAnimationController rubberAnimationController;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 600),
      tween: Tween<double>(begin: size.height / 2, end: 0),
      builder: (_, value, child) {
        return Transform.translate(
          offset: Offset(0, value),
          child: child,
        );
      },
      child: RubberBottomSheet(
          scrollController: rubberSheetScrollController,
          animationController: rubberAnimationController,
          lowerLayer: Container(
            color: Colors.transparent,
          ),
          upperLayer: Container(
            child: Column(
              children: [
                Container(
                    child: Center(
                        child: Image(
                  image: movie.imageLogo.image,
                  width: size.width / 2,
                ))),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                      color: white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50))),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(appPadding),
                    controller: rubberSheetScrollController,
                    children: [
                      IconButton(
                          alignment: Alignment.centerLeft,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                      Text(
                        textAlign: TextAlign.center,
                        movie.name,
                        style: const TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      GenresFormat(movie.genre, black),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            movie.rating.toString(),
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          StarRating(movie.rating)
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Director:${movie.director}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Actors',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 120.0,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: movie.castList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: appPadding),
                                child: Container(
                                  width: size.width / 6,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image(
                                          image:
                                              movie.castList[index].photo.image,
                                          width: size.width / 6,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        movie.castList[index].name,
                                        style: TextStyle(
                                          color: black.withOpacity(0.6),
                                          fontSize: 12,
                                        ),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      const Text(
                        'Story Line',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        movie.storyLine,
                        style: TextStyle(
                          fontSize: 15,
                          color: black.withOpacity(0.6),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 100.0,
                      ),
                    ],
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
