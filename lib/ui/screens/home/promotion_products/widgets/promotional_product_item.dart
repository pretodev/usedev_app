import 'package:flutter/material.dart';

import '../../../../../business/product/product.dart';
import '../../../../styles/styles.dart';

class PromotionalProductItem extends StatelessWidget {
  const PromotionalProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x1F780BF7),
            offset: Offset(0, 4),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.network(
            product.imageUrl,
            height: 253,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: context.appColors.mediumGray2,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.name,
                  textAlign: TextAlign.left,
                  style: context.appTextStyles.headlineSmall.copyWith(
                    color: context.appColors.darkBlue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  product.price.toString(),
                  textAlign: TextAlign.left,
                  style: context.appTextStyles.titleSmall.copyWith(
                    color: context.appColors.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
