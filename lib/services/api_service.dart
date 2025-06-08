import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hello_kitty/models/cat.dart';
import 'package:hello_kitty/core/constants.dart';

class ApiService {
  static const String _baseUrl = kApiBaseUrl;
  static const String _apiKey = kApiKey; 

  final http.Client _client;

  ApiService({http.Client? client}) : _client = client ?? http.Client();

  Future<Cat> fetchRandomCatWithBreed() async {
    final uri = Uri.parse('$_baseUrl/images/search?has_breeds=1&limit=1');
    final response = await _client.get(
      uri,
      headers: {'x-api-key': _apiKey},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      if (jsonData.isNotEmpty) {
        return Cat.fromJson(jsonData.first);
      } else {
        throw Exception('Empty response from API');
      }
    } else {
      throw Exception('Failed to load cat: ${response.statusCode}');
    }
  }
}
