part of '../home_screen.dart';

class _PromotionalProducts extends StatelessWidget {
  const _PromotionalProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        children: [
          Text(
            'Promos especiais',
            style: context.appTextStyles.headlineSmall.copyWith(
              color: context.appColors.darkBlue,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Visibility(
            visible: controller.value.isLoadingPromotionalProducts,
            child: const CircularProgressIndicator(),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.value.promotionalProducts.length,
            itemBuilder: (context, index) {
              final product = controller.value.promotionalProducts[index];
              return __PromotionalProductItem(product: product);
            },
          ),
        ],
      ),
    );
  }
}

class __PromotionalProductItem extends StatelessWidget {
  const __PromotionalProductItem({super.key, required this.product});

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
