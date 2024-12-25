import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final Set<int> _favoriteIndices = {};

  Set<int> get favoriteIndices => _favoriteIndices;

  void toggleFavorite(int index) {
    if (_favoriteIndices.contains(index)) {
      _favoriteIndices.remove(index);
    } else {
      _favoriteIndices.add(index);
    }
    notifyListeners();
  }
}
