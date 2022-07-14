import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ServiceCreatePage extends ConsumerWidget {
  const ServiceCreatePage({
    super.key,
    required this.closed,
  });

  final VoidCallback? closed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New'),
        leading: IconButton(
          onPressed: closed,
          icon: const Icon(Icons.close),
        ),
      ),
      body: const Center(
        child: Text('new'),
      ),
    );
  }
}
