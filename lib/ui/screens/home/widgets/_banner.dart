part of '../home_screen.dart';

class _Banner extends StatelessWidget {
  const _Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.darkBlue,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        children: [
          Image.asset(
            'assets/images/imagem_hero_mobile.png',
            height: 439.0,
            width: 312.0,
          ),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text.rich(
              TextSpan(
                text: 'Hora de abraçar seu ',
                style: context.appTextStyles.displaySmall.copyWith(
                  color: context.appColors.pink,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: 'lado geek!',
                    style: TextStyle(
                      color: context.appColors.green,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 48.0),
          FilledButton(
            onPressed: () {},
            child: const Text('ver as novidades!'),
          ),
        ],
      ),
    );
  }
}
