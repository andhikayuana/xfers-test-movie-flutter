import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/src/data/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc(this.movieRepository) : super(MovieLoading());

  @override
  Stream<Transition<MovieEvent, MovieState>> transformEvents(
    Stream<MovieEvent> events,
    transitionFn,
  ) {
    return super.transformEvents(
        events.debounceTime(
          Duration(
            milliseconds: 500,
          ),
        ),
        transitionFn);
  }

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    final currentState = state;
    print(currentState.toString());
    if (event is MovieFetching && !_hasReachedMax(currentState)) {
      try {
        if (currentState is MovieLoading) {
          final movies = await movieRepository.fetchMovies(1);
          yield MovieSuccess(movies.results, false, movies.page);
          return;
        }

        if (currentState is MovieSuccess) {
          final movies =
              await movieRepository.fetchMovies(currentState.currentPage + 1);
          yield movies.results.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : MovieSuccess(
                  currentState.movies + movies.results, false, movies.page);
        }
      } catch (e) {
        yield MovieFailure();
      }
    }
  }

  bool _hasReachedMax(MovieState currentState) =>
      currentState is MovieSuccess && currentState.hasReachedMax;
}
