part of '../home_screen.dart';

class _Searcher extends SliverPersistentHeaderDelegate {
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
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide.none,
          ),
          fillColor: context.appColors.mediumGray2,
          hintText: 'O que você procura?',
          suffixIcon: const Icon(Icons.search),
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
