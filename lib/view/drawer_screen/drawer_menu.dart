import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/view/home_screen/home_screen.dart';
import 'package:movie_ticket_app/view/drawer_screen/widget/menu_screen_widget.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const ZoomDrawer(
        showShadow: true,
        menuBackgroundColor: white,
        drawerShadowsBackgroundColor: white,
        menuScreen: MenuScreen(),
        mainScreen: HomeScreen());
  }
}
