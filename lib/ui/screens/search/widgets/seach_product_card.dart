import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../business/product/product.dart';
import '../../../styles/styles.dart';

class SeachProductCard extends StatelessWidget {
  const SeachProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: context.appColors.mediumGray1,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(17, 121, 11, 247),
            offset: Offset(0, 1),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              errorWidget: (context, url, error) => Container(),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: context.appColors.mediumGray2,
            padding: const EdgeInsets.all(16.0),
            constraints: const BoxConstraints(minHeight: 100.0),
            alignment: Alignment.bottomLeft,
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
                const SizedBox(height: 8.0),
                Text(
                  product.price.toString(),
                  textAlign: TextAlign.left,
                  style: context.appTextStyles.bodyMedium.copyWith(
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
