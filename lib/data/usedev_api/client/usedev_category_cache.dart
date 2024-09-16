import 'dart:async';

import '../../../business/category/category.dart';

class UsedevCategoryCache {
  final Map<int, Category> _categories = {};

  Timer? _clearTimer;

  void saveCategories(List<Category> categories) {
    for (final category in categories) {
      _categories[category.id] = category;
    }
    _clearTimer?.cancel();
    _clearTimer = Timer(
      const Duration(
        seconds: int.fromEnvironment('USEDEV_CACHE_EXPIRATION_IN_SECONDS'),
      ),
      () => clear(),
    );
  }

  Category? getCategory(int id) {
    return _categories[id];
  }

  List<Category> getCategories() {
    return _categories.values.toList();
  }

  void clear() {
    _categories.clear();
    _clearTimer?.cancel();
  }
}
