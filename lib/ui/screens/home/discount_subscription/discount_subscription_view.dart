import 'package:flutter/material.dart';

import '../../../commom/form/form_field_validators.dart';
import '../../../state/view_model_mixin.dart';
import '../../../styles/styles.dart';
import 'discount_subsction_view_model.dart';

class DiscountSubscriptionView extends StatefulWidget {
  const DiscountSubscriptionView({super.key});

  @override
  State<DiscountSubscriptionView> createState() =>
      _DiscountSubscriptionViewState();
}

class _DiscountSubscriptionViewState extends State<DiscountSubscriptionView>
    with ViewModelMixin<DiscountSubscriptionView, DiscountSubsctionViewModel> {
  final _formKey = GlobalKey<FormState>();
  final _inputController = TextEditingController();
  final _inputFocusNode = FocusNode();

  @override
  DiscountSubsctionViewModel createViewModel() {
    return DiscountSubsctionViewModel(
      onSubscribeSuccess: _showSubscriptionSuccess,
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _subscribe() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      viewModel.subscribe();
    }
  }

  void _showSubscriptionSuccess() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Inscrição realizada com sucesso!',
            textAlign: TextAlign.center,
          ),
          content: const Text(
            'Agora você receberá nossas novidades e descontos exclusivos por e-mail!',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
    _inputController.clear();
    _inputFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
      color: context.appColors.green,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Inscreva-se para ganhar descontos!',
              textAlign: TextAlign.center,
              style: context.appTextStyles.titleLarge.copyWith(
                color: context.appColors.darkBlue,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Cadastre seu email, receba novidades e descontos imperdíveis antes de todo mundo!',
              textAlign: TextAlign.center,
              style: context.appTextStyles.bodySmall.copyWith(
                color: context.appColors.darkBlue,
              ),
            ),
            const SizedBox(height: 32.0),
            TextFormField(
              textAlign: TextAlign.center,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => viewModel.email = value ?? '',
              onFieldSubmitted: (_) => _subscribe(),
              validator: emailValidator,
              controller: _inputController,
              focusNode: _inputFocusNode,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                hintText: 'Digite seu melhor endereço  de email',
                hintStyle: context.appTextStyles.labelSmall.copyWith(
                  color: context.appColors.darkBlue,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Visibility(
              visible: !viewModel.isLoading.value,
              replacement: const FilledButton(
                onPressed: null,
                child: Text('Aguarde um instante'),
              ),
              child: FilledButton(
                onPressed: _subscribe,
                child: const Text('Inscrever'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
