import 'package:flutter/material.dart';
import 'package:temporalobe/data/model/service/category.dart';

class CategoryFormField extends StatefulWidget {
  const CategoryFormField({super.key, required this.onChanged});

  final ValueChanged<Category?> onChanged;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CategoryFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter a category...',
        labelText: 'Category',
        prefixIcon: Icon(Icons.category),
        suffixIcon: Icon(Icons.arrow_drop_down),
      ),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        final Category? category;
        if (value.isEmpty) {
          category = null;
        } else {
          category = Category(name: value);
        }
        widget.onChanged(category);
      },
    );
  }
}
