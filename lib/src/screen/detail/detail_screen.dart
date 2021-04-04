import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
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
          child: Stack(
        children: [
          CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            imageUrl: movie.posterUrl(width: "w500"),
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.purple,
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.purple,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black87.withOpacity(0.5),
            ),
          ),
          CachedNetworkImage(
            width: double.infinity,
            height: 220,
            imageUrl: movie.backdropUrl(),
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.purple,
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.purple,
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.all(20),
              height: 400,
              child: Card(
                elevation: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CachedNetworkImage(
                          height: 170,
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
                        SizedBox(
                          height: 10,
                        ),
                        Text("⭐️ ${movie.vote_average}"),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            width: 200,
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
                            width: 200,
                            child: Text(
                              movie.release_date,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              movie.overview,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
