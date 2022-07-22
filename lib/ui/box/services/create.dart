import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:temporalobe/ui/box/services/component/create/account_card.dart';
import 'package:temporalobe/ui/box/services/component/create/form/category_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/form/memo_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/form/service_form_field.dart';
import 'package:temporalobe/ui/box/services/component/create/url_card.dart';

class ServiceCreatePage extends ConsumerWidget {
  const ServiceCreatePage({
    super.key,
    required this.closed,
  });

  final VoidCallback? closed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Service'),
        leading: IconButton(
          onPressed: closed,
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ServiceFormField(
                  onChanged: (value) {},
                ),
                CategoryFormField(
                  onChanged: (value) {},
                ),
                const Gap(16),
                Text(
                  'URL',
                  style: t.primaryTextTheme.titleMedium?.copyWith(
                    color: t.colorScheme.onSurface,
                  ),
                ),
                const UrlCars(),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ref.read(urlLengthProvider.state).state++;
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add URL'),
                  ),
                ),
                Text(
                  'Account',
                  style: t.primaryTextTheme.titleMedium?.copyWith(
                    color: t.colorScheme.onSurface,
                  ),
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
                  style: t.primaryTextTheme.titleMedium?.copyWith(
                    color: t.colorScheme.onSurface,
                  ),
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
    );
  }
}

final urlLengthProvider = StateProvider.autoDispose<int>((ref) => 0);

class UrlCars extends ConsumerWidget {
  const UrlCars({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final length = ref.watch(urlLengthProvider);

    return ListView.builder(
      itemCount: length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const UrlCard();
      },
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
