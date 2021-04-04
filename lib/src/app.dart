import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/src/bloc/movie/movie_bloc.dart';
import 'package:flutter_movie_app/src/data/repository/movie_repository.dart';
import 'package:flutter_movie_app/src/screen/splash/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (context) => MovieBloc(MovieRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'MovieApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
