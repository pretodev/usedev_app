import 'package:firebase_database/firebase_database.dart';
import 'package:result_dart/result_dart.dart';

import '../../../business/commom/values/email.dart';
import '../../../business/subscription/subscription_failure.dart';
import '../../../business/subscription/subscription_repository.dart';

class FirebaseSubscriptionRepository implements SubscriptionRepository {
  @override
  AsyncResult<Unit, SubscriptionFailure> subscribeDiscountAlert(
    Email email,
  ) async {
    final ref = FirebaseDatabase.instance.ref('discount_subscriptions');
    final event = await ref.orderByChild('email').equalTo(email.address).once();
    if (event.snapshot.value == null) {
      await ref.push().set({'email': email.address});
    }
    return const Result.success(unit);
  }
}
