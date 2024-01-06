import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/controller/localization_controller.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalizationController>(context);
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const ListTileWidget(
        title: Text('Home'),
        icon: Icon(Icons.home),
      ),
      ExpansionTile(
        title: const Text('Language'),
        children: [
          TextButton(
              onPressed: () {
                provider.setLocale(const Locale('en'));
              },
              child: const Text(
                'English',
                style: TextStyle(color: grey, fontWeight: FontWeight.w600),
              )),
          TextButton(
              onPressed: () {
                provider.setLocale(const Locale('ml'));
              },
              child: const Text(
                'Malayalam',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ))
        ],
      ),
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
