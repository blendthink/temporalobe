import 'package:flutter/material.dart';

class CategoryFormField extends StatefulWidget {
  const CategoryFormField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

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
      onChanged: widget.onChanged,
    );
  }
}
