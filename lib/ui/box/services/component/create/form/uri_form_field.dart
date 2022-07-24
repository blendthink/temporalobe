import 'package:flutter/material.dart';

class UriFormField extends StatefulWidget {
  const UriFormField({super.key, required this.onChanged});

  final ValueChanged<Uri> onChanged;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<UriFormField> {
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
      onChanged: (value) {
        final uri = Uri.tryParse(value);
        if (uri != null) {
          widget.onChanged(uri);
        }
      },
      validator: (value) {
        final uri = Uri.tryParse(value ?? '');
        if (uri == null) {
          return 'Must be entered in URI format';
        }
        return null;
      },
    );
  }
}
