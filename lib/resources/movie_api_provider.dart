import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';
import 'package:film/api/base.dart';
import 'package:film/config/api_key.dart';

class MovieApiProvider {
  Client client = Client();

  Future<ItemModel> fetchMovieList() async {
    final response = await client.get(Uri.parse("$baseUrl/movie/popular?api_key=$apiKey"));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  
}