import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ListTileWidget(
        title: Text('Home'),
        icon: Icon(Icons.home),
      ),
      ListTileWidget(
        title: Text('Language'),
        icon: Icon(Icons.language),
      )
    ]));
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.title, required this.icon});
  final Text title;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      leading: icon,
    );
  }
}
