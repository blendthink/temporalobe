import 'package:flutter/material.dart';
import 'package:temporalobe/data/model/service/field.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.field,
    required this.onChanged,
  });

  final Field field;

  final ValueChanged<Field> onChanged;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CustomFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final field = widget.field;
    final label = field.key;
    final initValue = field.value;
    final canObscure = field.canObscure;

    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.construction),
        ),
        suffixIcon: canObscure
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              )
            : null,
      ),
      initialValue: initValue,
      keyboardType: TextInputType.text,
      obscureText: canObscure && _isObscure,
      onChanged: (value) {
        widget.onChanged(field.copyWith(value: value));
      },
    );
  }
}
