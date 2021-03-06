import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:temporalobe/data/model/service/field.dart';
import 'package:temporalobe/ui/box/services/component/create/field_dialog.dart';
import 'package:temporalobe/ui/box/services/component/create/form/custom_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/form/password_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/form/totp_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/form/username_form_field.dart';

final fieldsProvider = StateProvider.autoDispose<List<Field>>((ref) => []);

class AccountCard extends ConsumerWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            const CustomFormFields(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextButton.icon(
                onPressed: () async {
                  final field = await showFieldDialog(
                    context: context,
                  );
                  if (field != null) {
                    ref
                        .read(fieldsProvider.state)
                        .update((fields) => [...fields, field]);
                  }
                },
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

class CustomFormFields extends ConsumerWidget {
  const CustomFormFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fields = ref.watch(fieldsProvider);

    return ListView.builder(
      itemCount: fields.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final field = fields[index];
        return CustomFormField(
          field: field,
          onChanged: (value) {},
        );
      },
    );
  }
}
