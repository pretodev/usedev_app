import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class SliverSeachHeaderDelegate extends SliverPersistentHeaderDelegate {
  final VoidCallback? onClicked;
  final bool staticMode;
  final bool autofocus;
  final bool backButton;
  final ValueChanged<String>? onChanged;

  SliverSeachHeaderDelegate({
    this.onClicked,
    this.staticMode = false,
    this.autofocus = false,
    this.backButton = false,
    this.onChanged,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      height: maxExtent,
      color: Colors.white,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(24.0),
      child: GestureDetector(
        onTap: staticMode ? onClicked : null,
        child: AbsorbPointer(
          absorbing: staticMode,
          child: TextField(
            textAlign: TextAlign.center,
            autofocus: autofocus,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide.none,
              ),
              fillColor: context.appColors.mediumGray2,
              hintText: 'O que você procura?',
              suffixIcon: const Icon(Icons.search),
              prefixIcon: backButton
                  ? IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 112.0;

  @override
  double get minExtent => 112.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
