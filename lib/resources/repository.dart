import 'dart:async';
import 'package:film/models/genre_model.dart';
import 'package:film/resources/movie_api_provider.dart';
import 'package:film/models/item_model.dart';
import 'package:film/resources/tv_api_provider.dart';
import 'genres_api_provider.dart';

class Repository {
  MovieApiProvider moviesApiProvider = MovieApiProvider();
  TvApiProvider tvApiProvider = TvApiProvider();
  GenresApiProvider genresApiProvider = GenresApiProvider();


  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
  Future<ItemModel> fetchAllTv() => tvApiProvider.fetchTvList();
  Future<GenresModel> fetchAllGenres() => genresApiProvider.fetchGenreList();
}