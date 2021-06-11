import 'dart:async';
import 'package:film/models/genre_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:film/api/base.dart';
import 'package:film/config/api_key.dart';

class GenresApiProvider {
  Client client = Client();
  Future<GenresModel> fetchGenreList() async {
    final response = await client.get(Uri.parse("$baseUrl/genre/movie/list?api_key=$apiKey"));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return GenresModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}