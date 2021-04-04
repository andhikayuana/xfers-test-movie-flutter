import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/data/model/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        height: 170,
        child: Row(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: movie.posterUrl(),
              placeholder: (context, url) => Container(
                width: 114,
                color: Colors.purple,
              ),
              errorWidget: (context, url, error) => Container(
                width: 114,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
