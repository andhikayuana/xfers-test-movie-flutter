import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/data/model/movie.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  static Route<Object> createRoute(Movie movie) {
    return MaterialPageRoute(
      builder: (context) => DetailScreen(
        movie: movie,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("hello detail"),
        ),
      ),
    );
  }
}
