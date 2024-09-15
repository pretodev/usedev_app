import 'dart:collection';

import 'package:signals_flutter/signals_flutter.dart';

typedef _SignalMetadata = ({
  bool? local,
  ReadonlySignal<dynamic> target,
  ({Function cb, EffectCleanup cleanup})? listener,
});

abstract class ViewModel {
  final _signals = HashMap<int, _SignalMetadata>();
  EffectCleanup? _cleanup;
  final _effects = <EffectCleanup>[];

  /// Callback para reconstruir a interface. Será definido no mixin.
  void Function() rebuild = () {};

  void _rebuild() {
    rebuild();
  }

  void _setup() {
    final cb = effect(() {
      for (final s in _signals.values.where((e) => e.local != null)) {
        s.target.value; // Acessa o valor para estabelecer dependência
      }
      _rebuild();
    });
    _cleanup?.call();
    _cleanup = cb;
  }

  void _watch(ReadonlySignal<dynamic> target, bool local) {
    if (_signals[target.globalId]?.local != null) {
      return;
    }
    final listener = _signals[target.globalId]?.listener;
    _signals[target.globalId] = (
      local: local,
      target: target,
      listener: listener,
    );
    _setup();
  }

  void _unwatch(ReadonlySignal<dynamic> target) {
    if (!_signals.containsKey(target.globalId)) return;
    final listener = _signals[target.globalId]?.listener;
    _signals[target.globalId] = (
      local: null,
      target: target,
      listener: listener,
    );
    _setup();
  }

  /// Cria um Signal<T> e observa as mudanças
  Signal<V> createSignal<V>(
    V val, {
    String? debugLabel,
    bool autoDispose = true,
  }) {
    final s = signal<V>(
      val,
      debugLabel: debugLabel,
      autoDispose: autoDispose,
    );
    _watch(s, true);
    return s;
  }

  /// Cria um Computed<T> e observa as mudanças
  Computed<V> createComputed<V>(
    V Function() cb, {
    String? debugLabel,
    bool autoDispose = true,
  }) {
    final s = computed<V>(
      cb,
      debugLabel: debugLabel,
      autoDispose: autoDispose,
    );
    _watch(s, true);
    return s;
  }

  /// Vincula um sinal existente e observa as mudanças
  S bindSignal<V, S extends ReadonlySignal<V>>(S val) {
    _watch(val, false);
    return val;
  }

  /// Desvincula um sinal existente
  S unbindSignal<V, S extends ReadonlySignal<V>>(S val) {
    _unwatch(val);
    return val;
  }

  /// Observa o valor de um sinal
  V watchSignal<V, S extends ReadonlySignal<V>>(S val) {
    return bindSignal(val).value;
  }

  /// Deixa de observar o valor de um sinal
  V unwatchSignal<V, S extends ReadonlySignal<V>>(S val) {
    return unbindSignal(val).value;
  }

  /// Cria um Effect
  EffectCleanup createEffect(
    dynamic Function() cb, {
    String? debugLabel,
    dynamic Function()? onDispose,
  }) {
    final s = effect(
      cb,
      debugLabel: debugLabel,
      onDispose: onDispose,
    );
    _effects.add(s);
    return () {
      _effects.remove(s);
      s();
    };
  }

  /// Limpa todos os sinais e efeitos armazenados
  void clearSignalsAndEffects() {
    _cleanup?.call();
    _cleanup = null;
    final local =
        _signals.values.where((e) => e.local == true).map((e) => e.target);
    for (final s in local) {
      s.dispose();
    }
    for (final cb in _effects) {
      cb();
    }
    _effects.clear();
    _signals.clear();
  }

  /// Deve ser chamado para descartar o ViewModel
  void dispose() {
    clearSignalsAndEffects();
  }
}
