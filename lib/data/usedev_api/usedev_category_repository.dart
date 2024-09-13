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
    final result = await _client.get(
      '/68bc50d055acb4ecc7356180131df477/raw/14369c7e25fca54941f5359299b3f4f118a573d6/usedev-categorias.json',
    );
    final categories = (result['categorias'] as Iterable)
        .map(
          (e) => Category(id: e['id'], name: e['nome'], imageUrl: e['imagem']),
        )
        .toList();
    return Result.success(categories);
  }
}
