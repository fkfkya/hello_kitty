import 'package:hello_kitty/models/cat.dart';
import 'package:hello_kitty/services/api_service.dart';

class CatRepository {
  final ApiService _apiService;

  CatRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  Future<Cat> getRandomCatWithBreed() async {
    try {
      return await _apiService.fetchRandomCatWithBreed();
    } catch (e) {
      rethrow;
    }
  }
}
