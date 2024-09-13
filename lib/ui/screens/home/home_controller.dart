part of 'home_screen.dart';

class HomeController extends ValueNotifier<HomeState> with ServiceLocatorMixin {
  HomeController() : super(const HomeState());

  void loadInitialData() {
    loadCategories();
    loadPromotionalProducts();
  }

  void loadCategories() async {
    value = value.copyWith(isLoadingCategories: true);
    final result = await getService<CategoryRepository>().getCategories();
    result.fold((categories) {
      value = value.copyWith(
        categories: categories,
        isLoadingCategories: false,
      );
    }, (failure) {
      value = value.copyWith(
        categoriesFailure: () => failure,
        isLoadingCategories: false,
      );
    });
  }

  void loadPromotionalProducts() async {
    value = value.copyWith(isLoadingPromotionalProducts: true);
    final result =
        await getService<ProductRepository>().getPromotionalProducts();
    result.fold((products) {
      value = value.copyWith(
        promotionalProducts: products,
        isLoadingPromotionalProducts: false,
      );
    }, (failure) {
      value = value.copyWith(
        promotionalProductsFailure: () => failure,
        isLoadingCategories: false,
      );
    });
  }
}
