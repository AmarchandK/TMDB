import 'package:flutter/material.dart';
import 'package:tmdb/text.dart';
import 'package:tmdb/top_rated.dart';
import 'package:tmdb/treanding.dart';
import 'package:tmdb/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List trendingMovies = [];
  late List topratedMovies = [];
  late List tv = [];

  final String apiKey = '83e54562ffc96e3822006c163eb3440e';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4M2U1NDU2MmZmYzk2ZTM4MjIwMDZjMTYzZWIzNDQwZSIsInN1YiI6IjYyZmI2NGQ0MjU4ODIzMDA3YTdjMTk1NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.McVj8f9_igr5yJjHBdxDciRtUjbSxbyMs9ksL5S6J6Y';
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const ModifiedText(
          text: 'TMDB Movie',
          color: Colors.white,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TrendingMovies(
              trending: trendingMovies,
            ),
            TopratedMovies(toprated: topratedMovies),
            TvMovies(
              tv: tv,
            )
          ],
        ),
      ),
    );
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult['results'];
      topratedMovies = topratedResult['results'];
      tv = tvResult['results'];
    });
  }
}
