import 'dart:convert';

import 'package:flutter_image_search/data/photo_api_repository.dart';
import 'package:flutter_image_search/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository {
  static const baseUrl = 'https://pixabay.com/api/';
  static const key = 'x';

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    client ??= http.Client();

    final response = await client
        .get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
