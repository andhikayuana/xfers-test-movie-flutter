import 'package:dio/dio.dart';
import 'package:flutter_movie_app/src/data/model/get_movie_response.dart';
import 'package:flutter_movie_app/src/data/remote/movie_api.dart';

class MovieRepository {
  final api = MovieApi();

  Future<GetMovieResponse> fetchMovies(int page) async {
    try {
      final Response response = await api.fetchMovies(page);
      final GetMovieResponse parsedResponse =
          GetMovieResponse.fromMap(response.data as Map<String, dynamic>);
      return parsedResponse;
    } catch (e) {
      Future.error(e);
    }
  }
}
