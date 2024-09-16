import 'package:flutter/material.dart';

import '../../commom/sliver/sliver_seach_header_delegate.dart';

class SearchScreen extends StatelessWidget {
  static Future<void> push(
    BuildContext context, {
    bool replace = false,
    String query = '',
  }) {
    final route = MaterialPageRoute<void>(
      builder: (context) => SearchScreen(query: query),
    );
    return replace
        ? Navigator.pushAndRemoveUntil(context, route, (_) => false)
        : Navigator.push(context, route);
  }

  const SearchScreen({super.key, this.query = ''});

  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverSeachHeaderDelegate(
              autofocus: true,
              backButton: true,
            ),
            pinned: true,
          ),
        ],
      ),
    );
  }
}
