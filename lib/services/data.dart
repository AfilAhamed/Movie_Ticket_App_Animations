import 'package:flutter/material.dart';
import '../model/cast_model.dart';
import '../model/movie_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieData {
  List<MovieModel>? movieList = [];
  final BuildContext context;
  MovieData(this.context) {
    movieList!.add(
      MovieModel(
          id: 0,
          name: AppLocalizations.of(context)!.movieName1,
          rating: 8.0,
          genre: [
            AppLocalizations.of(context)!.gener1,
          ],
          director: AppLocalizations.of(context)!.director1,
          storyLine: AppLocalizations.of(context)!.storyLine1,
          image: Image.asset("assets/image/togo.jpeg"),
          imageLogo: Image.asset("assets/image/togologo.png"),
          castList: [
            MovieCastModel(
              name: "Willem Dafoe",
              photo: Image.asset("assets/image/cast/willem.jpg"),
            ),
            MovieCastModel(
              name: "Julianne Nicholson",
              photo: Image.asset("assets/image/cast/julianne.jpg"),
            ),
            MovieCastModel(
              name: "Christopher Heyerdahl",
              photo: Image.asset("assets/image/cast/christopher.jpg"),
            ),
            MovieCastModel(
              name: "Michael McElhatton",
              photo: Image.asset("assets/image/cast/michael.jpg"),
            )
          ]),
    );
    movieList!.add(
      MovieModel(
          id: 1,
          name: AppLocalizations.of(context)!.movieName2,
          rating: 8.5,
          genre: ["Crime", "Drama"],
          director: AppLocalizations.of(context)!.director2,
          storyLine: AppLocalizations.of(context)!.storyLine2,
          image: Image.asset("assets/image/joker.jpeg"),
          imageLogo: Image.asset("assets/image/jokerlogo.png"),
          castList: [
            MovieCastModel(
              name: "Joaquin Phoenix",
              photo: Image.asset("assets/image/cast/joaquin.jpg"),
            ),
            MovieCastModel(
              name: "Robert De Niro",
              photo: Image.asset("assets/image/cast/niro.jpg"),
            ),
            MovieCastModel(
              name: "Zazie Beetz",
              photo: Image.asset("assets/image/cast/zazie.jpg"),
            ),
            MovieCastModel(
              name: "Frances Conroy",
              photo: Image.asset("assets/image/cast/frances.jpg"),
            ),
          ]),
    );
    movieList!.add(
      MovieModel(
          id: 2,
          name: AppLocalizations.of(context)!.movieName3,
          rating: 5.7,
          genre: ["Action", "Adventure", "Fantasy"],
          director: AppLocalizations.of(context)!.director3,
          storyLine: AppLocalizations.of(context)!.storyLine3,
          image: Image.asset("assets/image/apes.jpeg"),
          imageLogo: Image.asset("assets/image/apeslogo.png"),
          castList: [
            MovieCastModel(
              name: "Cornelius",
              photo: Image.asset("assets/image/cast/cornelius.jpg"),
            ),
            MovieCastModel(
              name: "Dr. Zaius",
              photo: Image.asset("assets/image/cast/zaius.jpg"),
            ),
            MovieCastModel(
              name: "Dr. Zira",
              photo: Image.asset("assets/image/cast/zira.jpg"),
            ),
            MovieCastModel(
              name: "Nova",
              photo: Image.asset("assets/image/cast/nova.jpg"),
            )
          ]),
    );
  }
}
