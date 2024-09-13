import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../commom/svg_icon.dart';
import '../../styles/styles.dart';

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
            child: _Footer(),
          ),
        ],
      ),
    );
  }
}
