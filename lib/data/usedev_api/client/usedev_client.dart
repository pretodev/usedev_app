import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../business/category/category.dart';
import '../../../business/product/product.dart';
import 'usedev_category_cache.dart';

class UsedevClient {
  final UsedevCategoryCache _categoryCache;

  UsedevClient({required UsedevCategoryCache categoryCache})
      : _categoryCache = categoryCache;

  Future<Map<String, dynamic>> _get(String jsonUrl) async {
    final response = await http.get(Uri.parse(jsonUrl));
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<List<Category>> getCategories() async {
    if (_categoryCache.getCategories().isNotEmpty) {
      return Future.value(_categoryCache.getCategories());
    }
    final result =
        await _get(const String.fromEnvironment('USEDEV_CATEGORIES_JSON_URL'));
    final categories = (result['categorias'] as Iterable)
        .map(
          (e) => Category(id: e['id'], name: e['nome'], imageUrl: e['imagem']),
        )
        .toList();
    _categoryCache.saveCategories(categories);

    return categories;
  }

  Future<List<Product>> getProducts() {
    return _get(const String.fromEnvironment('USEDEV_PRODUCTS_JSON_URL'))
        .then((result) {
      return (result['produtos'] as Iterable)
          .map(
            (e) => Product(
              id: e['id'],
              name: e['nome'],
              imageUrl: e['imagem'],
              price: e['preço'],
              category: Category(id: e['categoriaId'], name: '', imageUrl: ''),
            ),
          )
          .toList();
    });
  }
}
