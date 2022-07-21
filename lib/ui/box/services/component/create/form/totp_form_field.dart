import 'package:flutter/material.dart';

class TotpFormField extends StatefulWidget {
  const TotpFormField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<TotpFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Enter a TOTP...',
        labelText: 'TOTP',
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.security),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isObscure,
      onChanged: widget.onChanged,
    );
  }
}
