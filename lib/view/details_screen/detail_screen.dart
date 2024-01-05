import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/model/movie_model.dart';
import 'package:movie_ticket_app/view/details_screen/widgets/background_image.dart';
import 'package:movie_ticket_app/view/details_screen/widgets/buy_button.dart';
import 'package:movie_ticket_app/view/details_screen/widgets/detail_sheet.dart';
import 'package:rubber/rubber.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.movie, required this.size});
  final MovieModel movie;
  final Size size;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  RubberAnimationController? rubberAnimationController;
  ScrollController? rubberSheetScrollController;
  @override
  void initState() {
    super.initState();
    rubberSheetScrollController = ScrollController();
    rubberAnimationController = RubberAnimationController(
        vsync: this,
        lowerBoundValue: AnimationControllerValue(
          pixel: widget.size.height * 0.75,
        ),
        dismissable: false,
        upperBoundValue: AnimationControllerValue(
          percentage: 8.9,
        ),
        duration: Duration(milliseconds: 300),
        springDescription: SpringDescription.withDampingRatio(
            mass: 1,
            stiffness: Stiffness.LOW,
            ratio: DampingRatio.MEDIUM_BOUNCY));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          BackgroundImageWidget(background: widget.movie.image),
          DetailSheet(
            movie: widget.movie,
            rubberSheetScrollController: rubberSheetScrollController!,
            rubberAnimationController: rubberAnimationController!,
          ),
          BuyButton(widget.movie.name)
        ],
      ),
    );
  }
}
