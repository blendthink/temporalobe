import 'package:flutter/material.dart';

class UsernameFormField extends StatefulWidget {
  const UsernameFormField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<UsernameFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Enter a username...',
        labelText: 'Username',
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person),
        ),
      ),
      keyboardType: TextInputType.text,
      onChanged: widget.onChanged,
    );
  }
}
