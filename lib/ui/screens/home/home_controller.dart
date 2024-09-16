part of 'home_screen.dart';

class HomeController extends ValueNotifier<HomeState> with ServiceLocatorMixin {
  HomeController() : super(const HomeState());

  void loadInitialData() {
    loadCategories();
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
}
