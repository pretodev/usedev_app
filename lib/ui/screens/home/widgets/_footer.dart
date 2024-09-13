part of '../home_screen.dart';

class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 29.0),
      child: Text(
        'Desenvolvido por Alura. Projeto fictício sem fins comerciais.',
        textAlign: TextAlign.center,
        style: context.appTextStyles.labelSmall.copyWith(
          color: context.appColors.darkBlue,
        ),
      ),
    );
  }
}
