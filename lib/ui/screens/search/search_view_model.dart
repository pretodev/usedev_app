import 'dart:async';

import '../../../business/product/product.dart';
import '../../../business/product/product_repository.dart';
import '../../../initialize.dart';
import '../../state/async_value.dart';
import '../../state/view_model.dart';

class SearchViewModel extends ViewModel with ServiceLocatorMixin {
  late final _result = createSignal(const AsyncValue.data(<Product>[]));
  late final _query = createSignal('');

  List<Product> get result => _result.value.value ?? [];

  bool get isLoading => _result.value.isLoading;

  bool get isBlank => _query.value.isEmpty && result.isEmpty;

  bool get noResults => _query.value.isNotEmpty && result.isEmpty;

  Timer? _debounce;

  void searchProducts(String query) {
    _query.value = query;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    if (query.isEmpty) {
      _result.value = const AsyncValue.data(<Product>[]);
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 400), () async {
      _result.value = const AsyncValue.loading();
      await Future.delayed(const Duration(seconds: 2));
      final result =
          await getService<ProductRepository>().searchProducts(query);
      _result.value = result.fold((products) {
        return AsyncValue.data(products);
      }, (failure) {
        return AsyncValue.error(failure);
      });
    });
  }
}
