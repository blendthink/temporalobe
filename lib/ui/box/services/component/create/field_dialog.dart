import 'package:flutter/material.dart';
import 'package:temporalobe/data/model/service/field.dart';

class _FieldDialog extends StatefulWidget {
  const _FieldDialog();

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<_FieldDialog> {
  final _formKey = GlobalKey<FormState>();
  Field _field = const Field(key: '', value: '', canObscure: false);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Key',
              ),
              autofocus: true,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Required';
                }
                return null;
              },
              onChanged: (value) {
                _field = _field.copyWith(key: value);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Value',
              ),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                _field = _field.copyWith(value: value);
              },
            ),
            FormField<bool>(
              builder: (state) {
                return SwitchListTile(
                  title: const Text('Obscure Text'),
                  value: state.value ?? false,
                  onChanged: (value) {
                    state.didChange(value);
                    _field = _field.copyWith(canObscure: value);
                  },
                );
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            if (_formKey.currentState?.validate() == true) {
              Navigator.pop<Field>(context, _field);
            }
          },
        ),
      ],
    );
  }
}

Future<Field?> showFieldDialog({
  required BuildContext context,
}) {
  return showDialog(
    context: context,
    useRootNavigator: true,
    builder: (context) {
      return const _FieldDialog();
    },
  );
}
