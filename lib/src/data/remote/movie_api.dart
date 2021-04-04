import 'package:dio/dio.dart';

class MovieApi {
  Dio dio = Dio();

  final _baseUrl = "http://api.themoviedb.org";
  final _apiKey = "6753d9119b9627493ae129f3c3c99151";
  final _defaultQuery = "superman";

  Future<Response> fetchMovies(int page) async {
    try {
      final response = await dio.get(
        "$_baseUrl/3/search/movie",
        queryParameters: {
          "api_key": _apiKey,
          "page": page,
          "query": _defaultQuery,
        },
      );
      print("==BEGIN RESPONSE==");
      print(response.toString());
      print("==END RESPONSE==");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
