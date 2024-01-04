import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/view/home_screen/widget/background_list_view.dart';
import 'package:movie_ticket_app/view/home_screen/widget/custom_appbar.dart';
import 'package:movie_ticket_app/view/home_screen/widget/movie_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size get size => MediaQuery.of(context).size;

  double get movieItemWidth => size.width / 2 + 48;

  ScrollController backgroundScrollController = ScrollController();
  ScrollController movieScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    movieScrollController.addListener(() {
      backgroundScrollController
          .jumpTo(movieScrollController.offset * (size.width / movieItemWidth));
    });
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BackgroundListView(
            backgroundScrollController: backgroundScrollController,
          ),
          MovieListView(
            movieItemWidth: movieItemWidth,
            movieScrollController: movieScrollController,
          ),
          const CustomAppBar(),
        ],
      ),
    );
  }
}
