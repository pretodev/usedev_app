import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../business/category/category.dart';
import '../../../../styles/styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x267B7B7B),
            offset: Offset(0, 4),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: category.imageUrl,
            height: 253,
            width: double.infinity,
            fit: BoxFit.cover,
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
        ],
      ),
    );
  }
}
