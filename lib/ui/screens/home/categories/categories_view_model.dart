import '../../../../business/category/category.dart';
import '../../../../business/category/category_repository.dart';
import '../../../../initialize.dart';
import '../../../state/async_value.dart';
import '../../../state/view_model.dart';

class CategoriesViewModel extends ViewModel with ServiceLocatorMixin {
  late final _categories = createSignal(const AsyncValue.data(<Category>[]));

  List<Category> get categories => _categories.value.value ?? [];

  bool get isLoading => _categories.value.isLoading;

  void loadCategories() async {
    _categories.value = const AsyncValue.loading();
    final result = await getService<CategoryRepository>().getCategories();
    _categories.value = result.fold((categories) {
      return AsyncValue.data(categories);
    }, (failure) {
      return AsyncValue.error(failure);
    });
  }
}
