import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';
import 'package:signals_flutter/signals_flutter.dart';

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
  late final _subscription = this.createSignal(const AsyncValue.data(unit));

  late final isLoading = computed(() => _subscription.value.isLoading);

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
