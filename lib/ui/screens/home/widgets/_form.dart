part of '../home_screen.dart';

class _Form extends StatelessWidget {
  const _Form({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
      color: context.appColors.green,
      child: Column(
        children: [
          Text(
            'Inscreva-se para ganhar descontos!',
            textAlign: TextAlign.center,
            style: context.appTextStyles.titleLarge.copyWith(
              color: context.appColors.darkBlue,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24.0),
          Text(
            'Cadastre seu email, receba novidades e descontos imperdíveis antes de todo mundo!',
            textAlign: TextAlign.center,
            style: context.appTextStyles.bodySmall.copyWith(
              color: context.appColors.darkBlue,
            ),
          ),
          const SizedBox(height: 32.0),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              hintText: 'Digite seu melhor endereço  de email',
              hintStyle: context.appTextStyles.labelSmall.copyWith(
                color: context.appColors.darkBlue,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          FilledButton(onPressed: () {}, child: const Text('Inscrever')),
        ],
      ),
    );
  }
}
