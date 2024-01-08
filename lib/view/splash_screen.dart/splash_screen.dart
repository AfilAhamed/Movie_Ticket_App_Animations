import 'package:flutter/material.dart';
import 'package:movie_ticket_app/view/drawer_screen/drawer_menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Future<void> toHomeScreen() async {
    await Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const DrawerMenu()));
    });
  }

  @override
  void initState() {
    toHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AnimationController controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);
    late final Animation<double> animations =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);

    return Scaffold(
      body: Center(
        child: FadeTransition(
            opacity: animations,
            child: Image.asset('assets/image/pngwing.com.png')),
      ),
    );
  }
}
