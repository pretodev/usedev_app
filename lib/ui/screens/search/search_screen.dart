import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../business/category/category.dart';
import '../../../business/product/product.dart';
import '../../commom/sliver/sliver_seach_header_delegate.dart';
import '../../state/view_model_mixin.dart';
import '../../styles/styles.dart';
import 'search_view_model.dart';
import 'widgets/seach_product_card.dart';

class SearchScreen extends StatefulWidget {
  static Future<void> push(
    BuildContext context, {
    bool replace = false,
    String query = '',
  }) {
    final route = MaterialPageRoute<void>(
      builder: (context) => SearchScreen(query: query),
    );
    return replace
        ? Navigator.pushAndRemoveUntil(context, route, (_) => false)
        : Navigator.push(context, route);
  }

  const SearchScreen({super.key, this.query = ''});

  final String query;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with ViewModelMixin<SearchScreen, SearchViewModel> {
  @override
  SearchViewModel createViewModel() {
    return SearchViewModel();
  }

  @override
  Widget build(BuildContext context) {
    final fakeProduct = Product(
      id: 0,
      category: Category(id: 0, name: '', imageUrl: ''),
      name: 'Produto com nome legal',
      price: 99.99,
      imageUrl: 'imageUrl',
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverSeachHeaderDelegate(
              autofocus: true,
              backButton: true,
              onChanged: viewModel.searchProducts,
            ),
            pinned: true,
          ),

          SliverGrid(
            delegate: viewModel.isLoading
                ? SliverChildBuilderDelegate(
                    (context, index) => Skeletonizer(
                      enabled: true,
                      effect: PulseEffect(
                        from: context.appColors.mediumGray2,
                        to: context.appColors.mediumGray1,
                        duration: const Duration(seconds: 1),
                      ),
                      child: SeachProductCard(product: fakeProduct),
                    ),
                    childCount: 3,
                  )
                : SliverChildBuilderDelegate(
                    (context, index) {
                      final product = viewModel.result[index];
                      return SeachProductCard(product: product);
                    },
                    childCount: viewModel.result.length,
                  ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3.5,
            ),
          ),
          // Product grid
        ],
      ),
    );
  }
}
