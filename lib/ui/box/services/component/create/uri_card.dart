import 'package:flutter/material.dart';
import 'package:temporalobe/ui/box/services/component/create/form/uri_form_field.dart';

class UriCard extends StatelessWidget {
  const UriCard({super.key, required this.onChanged});

  final ValueChanged<Uri> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        child: UriFormField(
          onChanged: onChanged,
        ),
      ),
    );
  }
}
