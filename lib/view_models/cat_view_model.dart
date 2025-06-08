import 'package:flutter/material.dart';
import 'package:hello_kitty/models/cat.dart';
import 'package:hello_kitty/services/cat_repository.dart';

class CatViewModel extends ChangeNotifier {
  final CatRepository _repository;

  Cat? _currentCat;
  int _likeCount = 0;
  bool _isLoading = false;
  String? _errorMessage;

  CatViewModel({CatRepository? repository})
      : _repository = repository ?? CatRepository() {
    fetchNewCat(); 
  }

  Cat? get currentCat => _currentCat;
  int get likeCount => _likeCount;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchNewCat() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final cat = await _repository.getRandomCatWithBreed();
      _currentCat = cat;
    } catch (e) {
      _errorMessage = 'Ошибка загрузки котика ';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> likeCurrentCat() async {
    _likeCount++;
    notifyListeners();
    await fetchNewCat();
  }

  Future<void> skipCurrentCat() async {
    await fetchNewCat();
  }
}
