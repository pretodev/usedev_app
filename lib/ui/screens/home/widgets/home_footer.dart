import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

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
