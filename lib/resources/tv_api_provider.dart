import 'dart:async';
import 'package:film/api/base.dart';
import 'package:film/config/api_key.dart';
import 'package:film/models/popularTv_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class TvApiProvider {
  Client client = Client();
    Future<PopularTvModel> fetchTvList() async {
    final response = await client.get(Uri.parse("$baseUrl/tv/popular?api_key=$apiKey"));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return PopularTvModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  
}