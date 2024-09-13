part of '../home_screen.dart';

class _Categories extends StatelessWidget {
  const _Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        children: [
          Text(
            'Categorias',
            style: context.appTextStyles.headlineSmall.copyWith(
              color: context.appColors.darkBlue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Text(
            'De roupas a gadgets tecnológicos temos tudo para atender suas paixões e hobbies com estilo e autenticidade.',
            style: context.appTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),
          Visibility(
            visible: controller.value.isLoadingCategories,
            child: const CircularProgressIndicator(),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.value.categories.length,
            itemBuilder: (context, index) {
              final category = controller.value.categories[index];
              return _CategoryItem(category: category);
            },
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({super.key, required this.category});

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
