import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';

class BuyButton extends StatelessWidget {
  final String movieName;

  const BuyButton(this.movieName, {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      child: ClipPath(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.08,
          margin: EdgeInsets.symmetric(vertical: size.width * 0.05),
          child: MaterialButton(
            color: secondary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) =>
              //           BookingScreen(movieName: movieName),
              //     ));
            },
            child: const Text(
              'Buy Ticket',
              style: TextStyle(
                  color: white, fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}
