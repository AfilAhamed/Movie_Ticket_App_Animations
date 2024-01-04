import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/view/home_screen/widget/background_list_view.dart';
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
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          BackgroundListView(
            backgroundScrollController: backgroundScrollController,
          ),
          MovieListView(
            movieItemWidth: movieItemWidth,
            movieScrollController: movieScrollController,
          ),
        ],
      ),
    );
  }
}
