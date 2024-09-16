import 'package:flutter/material.dart';

import '../../../state/view_model_mixin.dart';
import '../../../styles/styles.dart';
import 'categories_view_model.dart';
import 'widgets/category_card.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView>
    with ViewModelMixin<CategoriesView, CategoriesViewModel> {
  @override
  CategoriesViewModel createViewModel() {
    return CategoriesViewModel();
  }

  @override
  void initState() {
    super.initState();
    viewModel.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        children: [
          Text(
            'Categorias',
            style: context.appTextStyles.headlineSmall.copyWith(
              color: context.appColors.darkBlue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Text(
            'De roupas a gadgets tecnológicos temos tudo para atender suas paixões e hobbies com estilo e autenticidade.',
            style: context.appTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),
          Visibility(
            visible: viewModel.isLoading,
            child: const CircularProgressIndicator(),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: viewModel.categories.length,
            itemBuilder: (context, index) {
              final category = viewModel.categories[index];
              return CategoryCard(category: category);
            },
          ),
        ],
      ),
    );
  }
}
