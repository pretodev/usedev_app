import 'package:flutter/material.dart';

import '../../../../../business/category/category.dart';
import '../../../../styles/styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          category.imageUrl,
          height: 253,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            category.name,
            textAlign: TextAlign.center,
            style: context.appTextStyles.headlineSmall.copyWith(
              color: context.appColors.darkBlue,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
