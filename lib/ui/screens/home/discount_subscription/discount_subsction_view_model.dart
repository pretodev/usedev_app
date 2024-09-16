import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../business/commom/values/email.dart';
import '../../../../business/subscription/subscription_repository.dart';
import '../../../../initialize.dart';
import '../../../state/async_value.dart';
import '../../../state/view_model.dart';

class DiscountSubsctionViewModel extends ViewModel with ServiceLocatorMixin {
  DiscountSubsctionViewModel({
    this.onSubscribeSuccess,
  });

  final VoidCallback? onSubscribeSuccess;
  late final _subscription = createSignal(const AsyncValue.data(unit));

  bool get isLoading => _subscription.value.isLoading;

  Email? _email;

  set email(String value) {
    _email = Email(value);
  }

  void subscribe() async {
    if (_email == null) {
      return;
    }

    _subscription.value = const AsyncValue.loading();
    final result = await getService<SubscriptionRepository>()
        .subscribeDiscountAlert(_email!);
    _subscription.value = result.fold(
      (_) {
        onSubscribeSuccess?.call();
        return const AsyncValue.data(unit);
      },
      (failure) => AsyncValue.error(failure),
    );
  }
}
