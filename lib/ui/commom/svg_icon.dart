import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/styles.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.name, {
    super.key,
    this.color,
    this.size = 24.0,
  });

  final String name;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$name.svg',
      height: size,
      width: size,
      colorFilter: color?.colorFilter,
    );
  }
}

enum PaymentIcons {
  visa('ico_cartao_visa'),
  mastercard('ico_cartao_master'),
  elo('ico_cartao_elo'),
  diners('ico_cartao_diners'),
  pix('ico_pix');

  final String name;

  const PaymentIcons(this.name);
}

enum SocialIcons {
  whatsapp('whatsapp'),
  instagram('instagram'),
  tiktok('tiktok');

  final String name;

  const SocialIcons(this.name);
}
