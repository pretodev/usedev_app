import 'package:flutter/foundation.dart';

@immutable
class Contact {
  final String email;
  final String phone;
  final ({String instagram, String whatsapp, String tiktok}) socialMediaLinks;
  final (String start, String end) openingHours;

  const Contact({
    required this.email,
    required this.phone,
    required this.socialMediaLinks,
    required this.openingHours,
  });

  factory Contact.initilize() {
    return const Contact(
      email: 'sac@usedev.com.br',
      phone: '0800 541 320',
      socialMediaLinks: (
        instagram: 'instagram',
        whatsapp: 'whatsapp',
        tiktok: 'tiktok'
      ),
      openingHours: ('8h', '18h'),
    );
  }

  @override
  String toString() =>
      'Contact(email: $email, phone: $phone, openingHours: $openingHours)';
}
