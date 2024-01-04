import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';

class StarRating extends StatelessWidget {
  final double rating;

  const StarRating(this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget star(bool fill) {
      return Container(
        child: Icon(
          Icons.star,
          size: 18.0,
          color: fill ? primary : grey,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        if (index < (rating / 2).round()) {
          return star(true);
        } else {
          return star(false);
        }
      }),
    );
  }
}
