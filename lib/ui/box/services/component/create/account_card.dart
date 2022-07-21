import 'package:flutter/material.dart';
import 'package:temporalobe/ui/box/services/component/create/form/password_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/form/totp_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/form/username_form_field.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UsernameFormField(
              onChanged: (value) {},
            ),
            PasswordFormField(
              onChanged: (value) {},
            ),
            TotpFormField(
              onChanged: (value) {},
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add Custom field'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
