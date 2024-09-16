import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class SearchBlankContent extends StatelessWidget {
  const SearchBlankContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 48.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_rounded,
            size: 48.0,
            color: context.appColors.pink,
          ),
          const SizedBox(height: 16.0),
          Text(
            'Digite o nome do produto ou categoria que deseja encontrar :)',
            textAlign: TextAlign.center,
            style: context.appTextStyles.headlineSmall.copyWith(
              color: context.appColors.mediumGray1,
              fontWeight: FontWeight.w700,
              height: 33 / 25,
            ),
          ),
        ],
      ),
    );
  }
}
