import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_movie_app/src/data/model/movie.dart';

class GetMovieResponse {
  final int page;
  final List<Movie> results;
  final int total_pages;
  final int total_results;
  GetMovieResponse({
    @required this.page,
    @required this.results,
    @required this.total_pages,
    @required this.total_results,
  });

  GetMovieResponse copyWith({
    int page,
    List<Movie> results,
    int total_pages,
    int total_results,
  }) {
    return GetMovieResponse(
      page: page ?? this.page,
      results: results ?? this.results,
      total_pages: total_pages ?? this.total_pages,
      total_results: total_results ?? this.total_results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'results': results?.map((x) => x.toMap())?.toList(),
      'total_pages': total_pages,
      'total_results': total_results,
    };
  }

  factory GetMovieResponse.fromMap(Map<String, dynamic> map) {
    return GetMovieResponse(
      page: map['page']?.toInt(),
      results: List<Movie>.from(map['results']?.map((x) => Movie.fromMap(x))),
      total_pages: map['total_pages']?.toInt(),
      total_results: map['total_results']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetMovieResponse.fromJson(String source) =>
      GetMovieResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GetMovieResponse(page: $page, results: $results, total_pages: $total_pages, total_results: $total_results)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetMovieResponse &&
        other.page == page &&
        listEquals(other.results, results) &&
        other.total_pages == total_pages &&
        other.total_results == total_results;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        results.hashCode ^
        total_pages.hashCode ^
        total_results.hashCode;
  }
}
