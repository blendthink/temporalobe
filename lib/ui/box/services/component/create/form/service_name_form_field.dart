import 'package:flutter/material.dart';
import 'package:temporalobe/data/model/service/service_name.dart';
import 'package:temporalobe/extension/string.dart';

class ServiceNameFormField extends StatefulWidget {
  const ServiceNameFormField({super.key, required this.onChanged});

  final ValueChanged<ServiceName> onChanged;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ServiceNameFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Enter a service name...',
        labelText: 'Service Name',
        prefixIcon: Icon(Icons.public),
      ),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        widget.onChanged(ServiceName(value));
      },
      validator: (value) {
        if (value.isNullOrEmpty) {
          return 'Required';
        }
        return null;
      },
    );
  }
}
