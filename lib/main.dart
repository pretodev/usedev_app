import 'package:flutter/material.dart';

import 'business/category/category_repository.dart';
import 'business/product/product_repository.dart';
import 'data/usedev_api/client/usedev_client.dart';
import 'data/usedev_api/usedev_category_repository.dart';
import 'data/usedev_api/usedev_product_repository.dart';
import 'initialize.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/styles/styles.dart';

void main() async {
  initializeApp((i) {
    i.addLazySingleton(UsedevClient.new);
    i.addLazySingleton<CategoryRepository>(UsedevCategoryRepository.new);
    i.addLazySingleton<ProductRepository>(UsedevProductRepository.new);
    return const UseDevApp();
  });
}

class UseDevApp extends StatelessWidget {
  const UseDevApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppStyle().theme,
      home: const HomeScreen(),
    );
  }
}
