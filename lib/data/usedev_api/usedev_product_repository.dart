import 'package:result_dart/result_dart.dart';

import '../../business/product/product.dart';
import '../../business/product/product_failure.dart';
import '../../business/product/product_repository.dart';
import 'client/usedev_client.dart';

class UsedevProductRepository implements ProductRepository {
  final UsedevClient _client;

  UsedevProductRepository({required UsedevClient client}) : _client = client;

  @override
  AsyncResult<List<Product>, ProductFailure> getProducts() async {
    final products = await _client.getProducts();
    final categories = await _client.getCategories();
    final productsWithCategories = products.map((product) {
      final category = categories.firstWhere(
        (category) => category.id == product.category.id,
      );
      return product.copyWith(category: category);
    }).toList();
    return Result.success(productsWithCategories);
  }

  @override
  AsyncResult<List<Product>, ProductFailure> getPromotionalProducts() async {
    final result = await getProducts();
    return result.map(
      (products) {
        products.sort((a, b) => a.price.compareTo(b.price));
        return products.take(4).toList();
      },
    );
  }
}
