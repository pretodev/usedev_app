import 'package:flutter/widgets.dart';

import 'view_model.dart';

mixin ViewModelMixin<T extends StatefulWidget, VM extends ViewModel>
    on State<T> {
  late final VM viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = createViewModel();

    // Configura o callback de reconstrução
    viewModel.rebuild = () {
      if (mounted) {
        setState(() {});
      }
    };
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  /// Método que cria a instância do ViewModel
  VM createViewModel();
}
