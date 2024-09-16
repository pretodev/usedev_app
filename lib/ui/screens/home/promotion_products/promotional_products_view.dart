import 'package:flutter/material.dart';

import '../../../state/view_model_mixin.dart';
import '../../../styles/styles.dart';
import 'promotional_products_view_model.dart';
import 'widgets/promotional_product_item.dart';

class PromotionalProductsView extends StatefulWidget {
  const PromotionalProductsView({super.key});

  @override
  State<PromotionalProductsView> createState() =>
      _PromotionalProductsViewState();
}

class _PromotionalProductsViewState extends State<PromotionalProductsView>
    with ViewModelMixin<PromotionalProductsView, PromotionalProductsViewModel> {
  @override
  PromotionalProductsViewModel createViewModel() {
    return PromotionalProductsViewModel();
  }

  @override
  void initState() {
    super.initState();
    viewModel.loadPromotionalProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        children: [
          Text(
            'Promos especiais',
            style: context.appTextStyles.headlineSmall.copyWith(
              color: context.appColors.darkBlue,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Visibility(
            visible: viewModel.isLoading,
            child: const CircularProgressIndicator(),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: viewModel.products.length,
            itemBuilder: (context, index) {
              final product = viewModel.products[index];
              return PromotionalProductItem(product: product);
            },
          ),
        ],
      ),
    );
  }
}
