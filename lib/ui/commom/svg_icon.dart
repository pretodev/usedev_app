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
      colorFilter: color?.colorFilter ?? context.appColors.darkBlue.colorFilter,
    );
  }
}
