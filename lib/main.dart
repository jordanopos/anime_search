import 'package:anime_search/src/app/anime/bloc/anime_bloc.dart';
import 'package:anime_search/src/app/anime/repository/anime.repository.dart';
import 'package:anime_search/src/app/home/bloc/home_bloc.dart';
import 'package:anime_search/src/app/home/pages/home.inital.page.dart';
import 'package:anime_search/src/app/home/repository/home.repository.dart';
import 'package:anime_search/src/meta/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(AnimeSearch(
    homeRepository: HomeImpl(),
    animeRepository: AnimeImpl(),
  ));
}

class AnimeSearch extends StatelessWidget {
  final HomeRepository homeRepository;
  final AnimeRepository animeRepository;
  const AnimeSearch(
      {required this.homeRepository, required this.animeRepository});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(homeRepository),
        ),
        BlocProvider(create: (context) => AnimeBloc(animeRepository))
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: AppContants.mainColor,
          appBarTheme: AppBarTheme(backgroundColor : Colors.black),
            scaffoldBackgroundColor: Colors.black,
            brightness: Brightness.dark,
            fontFamily: "Circular"),
        debugShowCheckedModeBanner: false,
        title: "Anime Search",
        home: HomeInitialPage(),
      ),
    );
  }
}
