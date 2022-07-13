import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

const double _kListPadding = 8;
const _kListGap = Gap(_kListPadding / 2);
const double _kChipHeight = 32;
const double _kListHeight = _kChipHeight + _kListPadding * 2;

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({
    super.key,
    required this.onFilter,
    required this.categories,
  });

  final List<String> categories;

  final ValueChanged<String?> onFilter;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CategoryFilter> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _kListHeight,
      child: ListView.separated(
        padding: const EdgeInsets.all(_kListPadding),
        itemCount: widget.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          return ChoiceChip(
            label: Text(category),
            selected: _selectedIndex == index,
            onSelected: (selected) {
              setState(() {
                _selectedIndex = selected ? index : null;
              });
              widget.onFilter(selected ? category : null);
            },
          );
        },
        separatorBuilder: (context, index) => _kListGap,
      ),
    );
  }
}
