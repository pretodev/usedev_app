import '../../../../business/product/product.dart';
import '../../../../business/product/product_repository.dart';
import '../../../../initialize.dart';
import '../../../state/async_value.dart';
import '../../../state/view_model.dart';

class PromotionalProductsViewModel extends ViewModel with ServiceLocatorMixin {
  late final _products = createSignal(const AsyncValue.data(<Product>[]));

  bool get isLoading => _products.value.isLoading;

  List<Product> get products => _products.value.value ?? <Product>[];

  void loadPromotionalProducts() async {
    _products.value = const AsyncValue.loading();
    final result = await getService<ProductRepository>() //
        .getPromotionalProducts();
    _products.value = result.fold((products) {
      return AsyncValue.data(products);
    }, (failure) {
      return AsyncValue.error(failure);
    });
  }
}
