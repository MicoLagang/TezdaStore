import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _favorites = prefs.getStringList('ff_favorites') ?? _favorites;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _favorites = [];
  List<String> get favorites => _favorites;
  set favorites(List<String> value) {
    _favorites = value;
    prefs.setStringList('ff_favorites', value);
  }

  void addToFavorites(String value) {
    _favorites.add(value);
    prefs.setStringList('ff_favorites', _favorites);
  }

  void removeFromFavorites(String value) {
    _favorites.remove(value);
    prefs.setStringList('ff_favorites', _favorites);
  }

  void removeAtIndexFromFavorites(int index) {
    _favorites.removeAt(index);
    prefs.setStringList('ff_favorites', _favorites);
  }

  void updateFavoritesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _favorites[index] = updateFn(_favorites[index]);
    prefs.setStringList('ff_favorites', _favorites);
  }

  void insertAtIndexInFavorites(int index, String value) {
    _favorites.insert(index, value);
    prefs.setStringList('ff_favorites', _favorites);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
