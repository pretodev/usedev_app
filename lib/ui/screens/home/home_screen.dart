import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../commom/svg_icon.dart';
import '../../styles/styles.dart';
import 'categories/categories_view.dart';
import 'discount_subscription/discount_subscription_view.dart';
import 'promotion_products/promotional_products_view.dart';
import 'widgets/home_about.dart';
import 'widgets/home_banner.dart';
import 'widgets/home_footer.dart';
import 'widgets/home_searcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.menu_sharp,
                size: 32,
                color: context.appColors.darkBlue,
              ),
              onPressed: () {},
            ),
            title: SvgPicture.asset(
              'assets/logos/logo_usedev.svg',
              height: 48.0,
              colorFilter: context.appColors.darkBlue.colorFilter,
            ),
            actions: [
              IconButton(
                icon: const SvgIcon('perfil', size: 32.0),
                onPressed: () {},
              ),
              IconButton(
                icon: const SvgIcon('carrinho', size: 32.0),
                onPressed: () {},
              ),
            ],
            floating: true,
            snap: true,
            centerTitle: true,
            surfaceTintColor: Colors.white,
          ),
          SliverPersistentHeader(
            delegate: HomeSearcher(),
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: HomeBanner(),
          ),
          const SliverToBoxAdapter(
            child: CategoriesView(),
          ),
          const SliverToBoxAdapter(
            child: PromotionalProductsView(),
          ),
          const SliverToBoxAdapter(
            child: DiscountSubscriptionView(),
          ),
          const SliverToBoxAdapter(
            child: HomeAbout(),
          ),
          const SliverToBoxAdapter(
            child: HomeFooter(),
          ),
        ],
      ),
    );
  }
}
