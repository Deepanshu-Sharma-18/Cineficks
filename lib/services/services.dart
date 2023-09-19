import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:moviesapi/Models/Genres.dart';
import 'package:moviesapi/Models/movieCardModel.dart';
import 'package:moviesapi/Models/movieDetail.dart';
import 'package:moviesapi/Models/moviecast.dart';
import 'package:moviesapi/Models/nowplaying.dart';
import 'package:moviesapi/Models/reviews.dart';
import 'package:moviesapi/Models/searchresult.dart';
import 'package:moviesapi/Models/upcoming.dart';
import 'package:moviesapi/Models/watchmovie.dart';

import '../constants.dart';

class BaseClient {
  final int page;
  BaseClient({required this.page});

  final String apiKey = APIKEY;
  late String topRatedUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=$page";
  late String genresUrl =
      "https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US";
  late String popularUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=$page";
  late String nowplayingUrl =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=en-US&page=$page";
  late String upcomingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=$page";
  late String movieDetailUrl =
      "https://api.themoviedb.org/3/movie/$page?api_key=$apiKey&language=en-US";
  late String movieCastUrl =
      "https://api.themoviedb.org/3/movie/$page/credits?api_key=$apiKey&language=en-US";
  late String reviewsUrl =
      "https://api.themoviedb.org/3/movie/$page/reviews?api_key=$apiKey&language=en-US&page=1";
  late String similarUrl =
      "https://api.themoviedb.org/3/movie/$page/similar?api_key=$apiKey&language=en-US&page=1";
  late String watchUrl =
      "https://api.themoviedb.org/3/movie/$page/watch/providers?api_key=$apiKey";
  late String searchUrl =
      "https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=Avengers&page=1";

  Future<MovieModel> getData() async {
    Uri uri = Uri.parse(topRatedUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      //final jsonResponse = jsonDecode(response.body);
      // if (kDebugMode) {
      //   print(response.body.toString());
      // }
      return movieModelFromJson(response.body);
    } else {
      if (kDebugMode) {
        print(
            '=========================== failed to load data  ------------------------------------------- ${response.statusCode}');
      }
      throw Exception('Failed ${response.statusCode}');
    }
  }

  Future<Genres> getGenres() async {
    Uri uri = Uri.parse(genresUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      //final jsonResponse = jsonDecode(response.body);
      // if (kDebugMode) {
      //   print(response.body.toString());
      // }
      return genresFromJson(response.body);
    } else {
      if (kDebugMode) {
        print(
            '=========================== failed to load data  ------------------------------------------- ${response.statusCode}');
      }
      throw Exception('Failed ${response.statusCode}');
    }
  }

  Future<MovieCast> getMovieCast() async {
    Uri uri = Uri.parse(movieCastUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      //final jsonResponse = jsonDecode(response.body);
      // if (kDebugMode) {
      //   print(response.body.toString());
      // }
      return movieCastFromJson(response.body);
    } else {
      if (kDebugMode) {
        print(
            '=========================== failed to load data  ------------------------------------------- ${response.statusCode}');
      }
      throw Exception('Failed ${response.statusCode}');
    }
  }

  Future<SearchResult> getSearch(String query) async {
    String temp = query.replaceAll(RegExp(' '), '%20');
    searchUrl =
        "https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&query=$temp&page=1&include_adult=true";
    Uri uri = Uri.parse(searchUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      //final jsonResponse = jsonDecode(response.body);
      if (kDebugMode) {
        print(response.body.toString());
      }
      return searchResultFromJson(response.body);
    } else {
      if (kDebugMode) {
        print(
            '=========================== failed to load data  ------------------------------------------- ${response.statusCode}');
      }
      throw Exception('Failed ${response.statusCode}');
    }
  }

  Future<WatchProvider> getWatch() async {
    Uri uri = Uri.parse(watchUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      //final jsonResponse = jsonDecode(response.body);
      // if (kDebugMode) {
      //   print(response.body.toString());
      // }
      return watchProviderFromJson(response.body);
    } else {
      if (kDebugMode) {
        print(
            '=========================== failed to load data  ------------------------------------------- ${response.statusCode}');
      }
      throw Exception('Failed ${response.statusCode}');
    }
  }

  Future<FutureMovie> getUpcoming() async {
    Uri uri = Uri.parse(upcomingUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      //final jsonResponse = jsonDecode(response.body);
      // if (kDebugMode) {
      //   print(response.body.toString());
      // }
      return futureMovieFromJson(response.body);
    } else {
      if (kDebugMode) {
        print(
            '=========================== failed to load data  ------------------------------------------- ${response.statusCode}');
      }
      throw Exception('Failed ${response.statusCode}');
    }
  }

  Future<Reviews> getReviews() async {
    Uri uri = Uri.parse(reviewsUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      //final jsonResponse = jsonDecode(response.body);
      // if (kDebugMode) {
      //   print(response.body.toString());
      // }
      return reviewsFromJson(response.body);
    } else {
      if (kDebugMode) {
        print(
            '=========================== failed to load data  ------------------------------------------- ${response.statusCode}');
      }
      throw Exception('Failed ${response.statusCode}');
    }
  }

  Future<MovieDetail> getMovieDetail() async {
    Uri uri = Uri.parse(movieDetailUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      //final jsonResponse = jsonDecode(response.body);
      if (kDebugMode) {
        print(response.body.toString());
      }
      return movieDetailFromJson(response.body);
    } else {
      if (kDebugMode) {
        print(
            '=========================== failed to load data  ------------------------------------------- ${response.statusCode}');
      }
      throw Exception('Failed ${response.statusCode}');
    }
  }

  Future<MovieModel> getPopularMovie() async {
    Uri uri = Uri.parse(popularUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      //final jsonResponse = jsonDecode(response.body);
      // if (kDebugMode) {
      //   print(response.body.toString());
      // }
      return movieModelFromJson(response.body);
    } else {
      if (kDebugMode) {
        print(
            '=========================== failed to load data  ------------------------------------------- ${response.statusCode}');
      }
      throw Exception('Failed ${response.statusCode}');
    }
  }

  Future<MovieModel> getSimilarMovies() async {
    Uri uri = Uri.parse(similarUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      //final jsonResponse = jsonDecode(response.body);
      // if (kDebugMode) {
      //   print(response.body.toString());
      // }
      return movieModelFromJson(response.body);
    } else {
      if (kDebugMode) {
        print(
            '=========================== failed to load data  ------------------------------------------- ${response.statusCode}');
      }
      throw Exception('Failed ${response.statusCode}');
    }
  }

  Future<NowPlaying> getNowPlaying() async {
    Uri uri = Uri.parse(nowplayingUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      //final jsonResponse = jsonDecode(response.body);
      if (kDebugMode) {
        print("now playing : " + response.body.toString());
      }
      return nowPlayingFromJson(response.body);
    } else {
      if (kDebugMode) {
        print(
            '=========================== failed to load data  ------------------------------------------- ${response.statusCode}');
      }
      throw Exception('Failed ${response.statusCode}');
    }
  }
}
