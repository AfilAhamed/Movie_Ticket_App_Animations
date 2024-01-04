import 'package:flutter/material.dart';

class GenresFormat extends StatelessWidget {
  final List<String> genres;
  final Color color;

  const GenresFormat(this.genres, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget _dot = Container(
      width: 6.0,
      height: 6.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(50.0)),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(genres.length, (index) {
        if (index < genres.length - 1) {
          return Row(
            children: [
              Text(
                genres[index],
                style: TextStyle(color: color, fontSize: 12),
              ),
              _dot,
            ],
          );
        } else {
          return Text(
            genres[index],
            style: TextStyle(color: color, fontSize: 12),
          );
        }
      }),
    );
  }
}
