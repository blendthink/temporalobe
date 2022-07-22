import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:temporalobe/data/model/service/field.dart';
import 'package:temporalobe/ui/box/services/component/create/field_dialog.dart';
import 'package:temporalobe/ui/box/services/component/create/form/custom_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/form/password_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/form/totp_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/form/url_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/form/username_form_field.dart';

final urlsProvider = StateProvider.autoDispose<List<String>>((ref) => []);

class UrlCard extends ConsumerWidget {
  const UrlCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        child: UrlFormField(
          onChanged: (value) {},
        ),
      ),
    );
  }
}
