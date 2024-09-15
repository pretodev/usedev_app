import 'package:result_dart/result_dart.dart';

import '../commom/values/email.dart';
import 'subscription_failure.dart';

abstract interface class SubscriptionRepository {
  AsyncResult<Unit, SubscriptionFailure> subscribeDiscountAlert(Email email);
}
