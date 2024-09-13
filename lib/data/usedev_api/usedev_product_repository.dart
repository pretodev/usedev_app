import 'package:result_dart/result_dart.dart';

import '../../business/category/category.dart';
import '../../business/product/product.dart';
import '../../business/product/product_failure.dart';
import '../../business/product/product_repository.dart';
import 'client/usedev_client.dart';

class UsedevProductRepository implements ProductRepository {
  final UsedevClient _client;

  UsedevProductRepository({required UsedevClient client}) : _client = client;

  @override
  AsyncResult<List<Product>, ProductFailure> getProducts() async {
    final result = await _client.get(
      '/946cbbc91d0bc0e167eb6fd895a6b12a/raw/0f6661903360535587ebe583b959e84192cdb771/usedev-produtos.json',
    );
    final products = (result['produtos'] as Iterable)
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
    return Result.success(products);
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
