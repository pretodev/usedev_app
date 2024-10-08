import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config/contact.dart';
import '../../../commom/svg_icon.dart';
import '../../../styles/styles.dart';

class HomeAbout extends StatelessWidget {
  const HomeAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final contact = context.read<Contact>();

    return Container(
      padding: const EdgeInsets.all(60.0),
      color: context.appColors.darkBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            'assets/logos/logo_usedev_verde.svg',
            height: 48.0,
          ),
          const SizedBox(height: 24.0),
          Text(
            'Hora de abraçar o seu lado geek!',
            textAlign: TextAlign.center,
            style: context.appTextStyles.labelSmall.copyWith(
              color: context.appColors.green,
            ),
          ),
          const SizedBox(height: 32.0),
          Divider(
            color: context.appColors.green,
            thickness: 2.0,
          ),
          const SizedBox(height: 32.0),
          Text(
            'Funcionamento',
            textAlign: TextAlign.left,
            style: context.appTextStyles.bodyLarge.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Segunda à Sexta - ${contact.openingHours.$1} às ${contact.openingHours.$2}',
            textAlign: TextAlign.left,
            style: context.appTextStyles.bodySmall.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            contact.email,
            textAlign: TextAlign.left,
            style: context.appTextStyles.bodySmall.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            contact.phone,
            textAlign: TextAlign.left,
            style: context.appTextStyles.bodySmall.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 32.0),
          Text(
            'Formas de pagamento',
            textAlign: TextAlign.left,
            style: context.appTextStyles.bodyLarge.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: PaymentIcons.values
                .map(
                  (icon) => SvgIcon(
                    icon.name,
                    color: null,
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 32.0),
          Text(
            'Siga nossas redes:',
            textAlign: TextAlign.left,
            style: context.appTextStyles.bodyLarge.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: SvgIcon(
                  SocialIcons.whatsapp.name,
                  size: 36.0,
                ),
                onPressed: () => launchUrl(
                  Uri.parse(contact.socialMediaLinks.whatsapp),
                ),
              ),
              const SizedBox(width: 4.0),
              IconButton(
                icon: SvgIcon(
                  SocialIcons.instagram.name,
                  size: 36.0,
                ),
                onPressed: () => launchUrl(
                  Uri.parse(contact.socialMediaLinks.instagram),
                ),
              ),
              const SizedBox(width: 4.0),
              IconButton(
                icon: SvgIcon(
                  SocialIcons.tiktok.name,
                  size: 36.0,
                ),
                onPressed: () => launchUrl(
                  Uri.parse(contact.socialMediaLinks.tiktok),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
