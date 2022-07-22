import 'package:flutter/material.dart';

class UrlFormField extends StatefulWidget {
  const UrlFormField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<UrlFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Enter a URL...',
        labelText: 'URL',
        prefixIcon: Icon(Icons.link),
      ),
      keyboardType: TextInputType.url,
      onChanged: widget.onChanged,
    );
  }
}
