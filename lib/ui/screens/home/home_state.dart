part of 'home_screen.dart';

@immutable
class HomeState {
  final List<Category> categories;
  final bool isLoadingCategories;
  final CategoryFailure? categoriesFailure;

  final List<Product> promotionalProducts;
  final bool isLoadingPromotionalProducts;
  final ProductFailure? promotionalProductsFailure;

  const HomeState({
    this.categories = const [],
    this.isLoadingCategories = false,
    this.categoriesFailure,
    this.promotionalProducts = const [],
    this.isLoadingPromotionalProducts = false,
    this.promotionalProductsFailure,
  });

  HomeState copyWith({
    List<Category>? categories,
    bool? isLoadingCategories,
    ValueGetter<CategoryFailure?>? categoriesFailure,
    List<Product>? promotionalProducts,
    bool? isLoadingPromotionalProducts,
    ValueGetter<ProductFailure?>? promotionalProductsFailure,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      categoriesFailure: categoriesFailure != null
          ? categoriesFailure()
          : this.categoriesFailure,
      promotionalProducts: promotionalProducts ?? this.promotionalProducts,
      isLoadingPromotionalProducts:
          isLoadingPromotionalProducts ?? this.isLoadingPromotionalProducts,
      promotionalProductsFailure: promotionalProductsFailure != null
          ? promotionalProductsFailure()
          : this.promotionalProductsFailure,
    );
  }

  @override
  String toString() {
    return 'HomeState(categories: $categories, isLoadingCategories: $isLoadingCategories, categoriesFailure: $categoriesFailure, promotionalProducts: $promotionalProducts, isLoadingPromotionalProducts: $isLoadingPromotionalProducts, promotionalProductsFailure: $promotionalProductsFailure)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState &&
        foundation.listEquals(other.categories, categories) &&
        other.isLoadingCategories == isLoadingCategories &&
        other.categoriesFailure == categoriesFailure &&
        foundation.listEquals(other.promotionalProducts, promotionalProducts) &&
        other.isLoadingPromotionalProducts == isLoadingPromotionalProducts &&
        other.promotionalProductsFailure == promotionalProductsFailure;
  }

  @override
  int get hashCode {
    return categories.hashCode ^
        isLoadingCategories.hashCode ^
        categoriesFailure.hashCode ^
        promotionalProducts.hashCode ^
        isLoadingPromotionalProducts.hashCode ^
        promotionalProductsFailure.hashCode;
  }
}
