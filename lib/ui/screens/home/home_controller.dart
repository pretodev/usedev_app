part of 'home_screen.dart';

class HomeController extends ValueNotifier<HomeState> with ServiceLocatorMixin {
  HomeController() : super(const HomeState());

  void loadCategories() async {
    value = value.copyWith(isLoadingCategories: true);
    final result = await getService<CategoryRepository>().getCategories();
    result.fold((categories) {
      print(categories);
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
