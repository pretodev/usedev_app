import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/contact.dart';
import '../../commom/svg_icon.dart';
import '../../styles/styles.dart';
import 'categories/categories_view.dart';
import 'discount_subscription/discount_subscription_view.dart';
import 'promotion_products/promotional_products_view.dart';

part 'widgets/_about.dart';
part 'widgets/_banner.dart';
part 'widgets/_footer.dart';
part 'widgets/_searcher.dart';

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
          ),
          SliverPersistentHeader(
            delegate: _Searcher(),
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: _Banner(),
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
            child: _About(),
          ),
          const SliverToBoxAdapter(
            child: _Footer(),
          ),
        ],
      ),
    );
  }
}
