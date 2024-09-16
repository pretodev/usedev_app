import 'package:result_dart/result_dart.dart';

import '../../business/category/category.dart';
import '../../business/category/category_failure.dart';
import '../../business/category/category_repository.dart';
import 'client/usedev_client.dart';

class UsedevCategoryRepository implements CategoryRepository {
  final UsedevClient _client;

  UsedevCategoryRepository({
    required UsedevClient client,
  }) : _client = client;

  @override
  AsyncResult<List<Category>, CategoryFailure> getCategories() async {
    final categories = await _client.getCategories();
    return Result.success(categories);
  }
}
