import 'package:firebase_database/firebase_database.dart';

import 'contact.dart';

class RemoteConfig {
  RemoteConfig._();

  static final instance = RemoteConfig._();

  Contact _contact = Contact.initilize();

  Contact get contact => _contact;

  Future<void> load() async {
    final snapshot =
        await FirebaseDatabase.instance.ref('usedev-contatos').get();
    final value = snapshot.value as Map;
    final socialLinks = value['social'] as Map;
    final openingHours = value['opening_hours'] as Map;
    _contact = Contact(
      email: value['email'] ?? _contact.email,
      phone: value['phone'] ?? _contact.phone,
      socialMediaLinks: (
        instagram:
            socialLinks['instagram'] ?? _contact.socialMediaLinks.instagram,
        whatsapp: socialLinks['whatsapp'] ?? _contact.socialMediaLinks.whatsapp,
        tiktok: socialLinks['tiktok'] ?? _contact.socialMediaLinks.tiktok,
      ),
      openingHours: (
        openingHours['start'] ?? _contact.openingHours.$1,
        openingHours['end'] ?? _contact.openingHours.$2,
      ),
    );
  }
}
