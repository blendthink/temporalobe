import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:temporalobe/data/model/service/account.dart';
import 'package:temporalobe/data/model/service/category.dart';
import 'package:temporalobe/data/model/service/service.dart';
import 'package:temporalobe/data/model/service/service_name.dart';
import 'package:temporalobe/ui/box/services/component/create/account_card.dart';
import 'package:temporalobe/ui/box/services/component/create/form/category_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/form/memo_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/form/service_name_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/uri_cards.dart';

class _FormData {
  ServiceName serviceName = const ServiceName('');
  Category category = const Category('');
  List<Uri> uris = [];
  List<Account> accounts = [];
}

class ServiceCreatePage extends ConsumerStatefulWidget {
  const ServiceCreatePage({
    super.key,
    required this.closed,
  });

  final VoidCallback closed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<ServiceCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _formData = _FormData();

  Future<bool> _shouldBack(BuildContext context) async {
    primaryFocus?.unfocus();
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Discard Changes'),
            content:
                const Text('Are you sure you want to discard the changes?'),
            actions: [
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.pop<bool>(context, false);
                },
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop<bool>(context, true);
                },
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);

    return WillPopScope(
      onWillPop: () async => _shouldBack(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Service'),
          leading: IconButton(
            onPressed: () async {
              final shouldBack = await _shouldBack(context);
              if (shouldBack) {
                widget.closed();
              }
            },
            icon: const Icon(Icons.close),
          ),
          actions: [
            IconButton(
              onPressed: () {
                final validate = _formKey.currentState!.validate();
                if (validate) {}

                final service = Service(
                  name: _formData.serviceName,
                  category: _formData.category,
                  uris: [],
                  accounts: [],
                );

                log(jsonEncode(service));
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ServiceNameFormField(
                    onChanged: (value) {
                      _formData.serviceName = value;
                    },
                  ),
                  CategoryFormField(
                    onChanged: (value) {
                      _formData.category = value;
                    },
                  ),
                  const Gap(16),
                  Text(
                    'URL',
                    style: t.textTheme.titleMedium,
                  ),
                  UriCards(
                    onChanged: (value) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('Add URL'),
                    ),
                  ),
                  Text(
                    'Account',
                    style: t.textTheme.titleMedium,
                  ),
                  const AccountCards(),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ref.read(accountLengthProvider.state).state++;
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Account'),
                    ),
                  ),
                  Text(
                    'Memo',
                    style: t.textTheme.titleMedium,
                  ),
                  const Gap(16),
                  MemoFormField(
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final accountLengthProvider = StateProvider.autoDispose<int>((ref) => 0);

class AccountCards extends ConsumerWidget {
  const AccountCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final length = ref.watch(accountLengthProvider);

    return ListView.builder(
      itemCount: length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const AccountCard();
      },
    );
  }
}
