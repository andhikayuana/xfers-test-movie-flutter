import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/data/model/movie.dart';

typedef OnTapMovieCardItem = Function(Movie movie);

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key key,
    @required this.movie,
    @required this.onTap,
  }) : super(key: key);

  final Movie movie;
  final OnTapMovieCardItem onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () => onTap(movie),
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
                  color: Colors.purple,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
                      width: 245,
                      child: Text(
                        movie.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 245,
                      child: Text(
                        movie.release_date,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 245,
                      child: Text(
                        movie.overview,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
