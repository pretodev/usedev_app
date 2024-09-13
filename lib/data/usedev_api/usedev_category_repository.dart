import 'package:result_dart/result_dart.dart';

import '../../business/category/category.dart';
import '../../business/category/category_failure.dart';
import '../../business/category/category_repository.dart';
import 'client/usedev_client.dart';

class UsedevCategoryRepository implements CategoryRepository {
  final UsedevClient _client;

  UsedevCategoryRepository({required UsedevClient client}) : _client = client;

  @override
  AsyncResult<List<Category>, CategoryFailure> getCategories() async {
    final result = await _client
        .get(const String.fromEnvironment('USEDEV_CATEGORIES_JSON_URL'));
    final categories = (result['categorias'] as Iterable)
        .map(
          (e) => Category(id: e['id'], name: e['nome'], imageUrl: e['imagem']),
        )
        .toList();
    return Result.success(categories);
  }
}
