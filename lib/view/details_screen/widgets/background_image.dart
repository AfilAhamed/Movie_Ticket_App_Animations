import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';

class BackgroundImageWidget extends StatelessWidget {
  final Image background;

  const BackgroundImageWidget({super.key, required this.background});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      top: -48,
      bottom: 0,
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 700),
        tween: Tween<double>(begin: 0.25, end: 1),
        builder: (_, value, child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        child: Stack(
          children: [
            Image(
              image: background.image,
              width: size.width,
              height: size.height,
              fit: BoxFit.cover,
            ),
            Container(
              width: size.width,
              height: size.height,
              color: black.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }
}
