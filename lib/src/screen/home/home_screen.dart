import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/src/bloc/movie/movie_bloc.dart';
import 'package:flutter_movie_app/src/bloc/movie/movie_event.dart';
import 'package:flutter_movie_app/src/bloc/movie/movie_state.dart';
import 'package:flutter_movie_app/src/widget/bottom_loader.dart';
import 'package:flutter_movie_app/src/widget/movie_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

  static Route<Object> createRoute() {
    return MaterialPageRoute(
      builder: (context) => HomeScreen(),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  MovieBloc _movieBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _movieBloc = BlocProvider.of<MovieBloc>(context);
    _movieBloc.add(MovieFetching());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll <= maxScroll) {
      _movieBloc.add(MovieFetching());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MovieApp: Superman"),
      ),
      body: Container(
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is MovieFailure) {
              return Center(
                child: Text("Failed to fetch movies"),
              );
            }

            if (state is MovieSuccess) {
              return ListView.builder(
                controller: _scrollController,
                itemCount: state.hasReachedMax
                    ? state.movies.length
                    : state.movies.length + 1,
                itemBuilder: (context, index) {
                  return index >= state.movies.length
                      ? BottomLoader()
                      : MovieCard(
                          movie: state.movies[index],
                        );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
