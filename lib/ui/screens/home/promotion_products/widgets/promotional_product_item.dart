import 'package:flutter/material.dart';

import '../../../../../business/product/product.dart';
import '../../../../styles/styles.dart';

class PromotionalProductItem extends StatelessWidget {
  const PromotionalProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          product.imageUrl,
          height: 253,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                product.name,
                textAlign: TextAlign.left,
                style: context.appTextStyles.titleLarge.copyWith(
                  color: context.appColors.darkBlue,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                product.price.toString(),
                textAlign: TextAlign.left,
                style: context.appTextStyles.titleSmall.copyWith(
                  color: context.appColors.darkBlue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
