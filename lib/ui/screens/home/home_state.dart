part of 'home_screen.dart';

@immutable
class HomeState {
  final List<Category> categories;
  final bool isLoadingCategories;
  final CategoryFailure? categoriesFailure;

  const HomeState({
    this.categories = const [],
    this.isLoadingCategories = false,
    this.categoriesFailure,
  });

  HomeState copyWith({
    List<Category>? categories,
    bool? isLoadingCategories,
    ValueGetter<CategoryFailure?>? categoriesFailure,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      categoriesFailure: categoriesFailure != null
          ? categoriesFailure()
          : this.categoriesFailure,
    );
  }

  @override
  String toString() =>
      'HomeState(categories: $categories, isLoadingCategories: $isLoadingCategories, categoriesFailure: $categoriesFailure)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState &&
        foundation.listEquals(other.categories, categories) &&
        other.isLoadingCategories == isLoadingCategories &&
        other.categoriesFailure == categoriesFailure;
  }

  @override
  int get hashCode =>
      categories.hashCode ^
      isLoadingCategories.hashCode ^
      categoriesFailure.hashCode;
}
