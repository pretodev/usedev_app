import 'package:flutter/material.dart';

import '../styles/styles.dart';

class Counter extends StatefulWidget {
  const Counter({super.key, this.onChanged});

  final ValueChanged<int>? onChanged;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void increment() {
    setState(() => count++);
    widget.onChanged?.call(count);
  }

  void decrement() {
    setState(() => count--);
    widget.onChanged?.call(count);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterButton.remove(onPressed: count > 0 ? decrement : null),
        const SizedBox(width: 8.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
          decoration: BoxDecoration(
            border: Border.all(color: context.appColors.darkBlue),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            count.toString(),
            style: context.appTextStyles.bodySmall.copyWith(
              color: context.appColors.darkBlue,
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        CounterButton.add(onPressed: increment),
      ],
    );
  }
}

class CounterButton extends StatelessWidget {
  const CounterButton._({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final IconData icon;
  final VoidCallback? onPressed;

  factory CounterButton.add({Key? key, VoidCallback? onPressed}) =>
      CounterButton._(key: key, icon: Icons.add, onPressed: onPressed);

  factory CounterButton.remove({Key? key, VoidCallback? onPressed}) =>
      CounterButton._(key: key, icon: Icons.remove, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.0,
      width: 32.0,
      child: IconButton(
        icon: Icon(icon, size: 24.0),
        padding: const EdgeInsets.all(0),
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(0),
          ),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: onPressed != null
                  ? BorderSide(color: context.appColors.darkBlue)
                  : BorderSide(
                      color: context.appColors.darkBlue.withOpacity(0.3),
                    ),
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
