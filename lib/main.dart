import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_ticket_app/controller/animation_controller.dart';
import 'package:movie_ticket_app/controller/localization_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_ticket_app/view/splash_screen.dart/splash_screen.dart';
import 'package:provider/provider.dart';
import 'l10n/l10n.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MovieAnimationController()),
      ChangeNotifierProvider(create: (context) => LocalizationController())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Ticket Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Open-Sans",
      ),
      supportedLocales: L10n.all,
      locale: Provider.of<LocalizationController>(context).locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const SplashScreen(),
    );
  }
}
