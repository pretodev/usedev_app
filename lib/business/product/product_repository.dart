import 'package:result_dart/result_dart.dart';

import 'product.dart';
import 'product_failure.dart';

abstract interface class ProductRepository {
  AsyncResult<List<Product>, ProductFailure> getPromotionalProducts();

  AsyncResult<List<Product>, ProductFailure> getProducts();

  AsyncResult<List<Product>, ProductFailure> searchProducts(String query);
}
