import 'package:equatable/equatable.dart';

import 'package:flutter_movie_app/src/data/model/movie.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieLoading extends MovieState {}

class MovieFailure extends MovieState {}

class MovieSuccess extends MovieState {
  final List<Movie> movies;
  final bool hasReachedMax;
  final int currentPage;

  const MovieSuccess(
    this.movies,
    this.hasReachedMax,
    this.currentPage,
  );

  MovieSuccess copyWith({
    List<Movie> movies,
    bool hasReachedMax,
    int currentPage,
  }) {
    return MovieSuccess(
      movies ?? this.movies,
      hasReachedMax ?? this.hasReachedMax,
      currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [movies, hasReachedMax, currentPage];

  @override
  String toString() =>
      'HomeSuccess(movies: $movies, hasReachedMax: $hasReachedMax, currentPage: $currentPage)';
}
