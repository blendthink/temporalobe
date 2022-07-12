import 'package:flutter/material.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({
    super.key,
    required this.onFilter,
    required this.categories,
  });

  final List<String> categories;

  final ValueChanged<String> onFilter;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CategoryFilter> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
