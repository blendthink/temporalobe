import 'package:flutter/material.dart';
import 'package:temporalobe/extension/string.dart';

class ServiceFormField extends StatefulWidget {
  const ServiceFormField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ServiceFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Enter a service...',
        labelText: 'Service',
        prefixIcon: Icon(Icons.public),
      ),
      keyboardType: TextInputType.text,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return 'Required';
        }
        return null;
      },
    );
  }
}
