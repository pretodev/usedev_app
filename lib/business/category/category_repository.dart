import 'package:result_dart/result_dart.dart';

import 'category.dart';
import 'category_failure.dart';

abstract interface class CategoryRepository {
  AsyncResult<List<Category>, CategoryFailure> getCategories();
}
