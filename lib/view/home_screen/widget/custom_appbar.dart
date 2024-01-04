import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.075,
      width: size.width * 0.15,
      decoration: BoxDecoration(border: Border.all()),
    );
  }
}
