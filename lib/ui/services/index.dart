import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:temporalobe/data/model/service/category.dart';
import 'package:temporalobe/ui/services/component/service_tile.dart';

class ServicesPage extends HookConsumerWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temporalobe'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final category = item.key;
          final services = item.value;
          return StickyHeader(
            header: ColoredBox(
              color: t.colorScheme.surfaceVariant,
              child: ListTile(
                title: Text(
                  category.name,
                  style: t.textTheme.titleSmall!.copyWith(
                    color: t.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
            content: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return ServiceTile(service: service);
              },
            ),
          );
        },
      ),
    );
  }
}

const items = <MapEntry<ServiceCategory, List<ServiceItem>>>[
  MapEntry(
    ServiceCategory(name: 'Work'),
    <ServiceItem>[
      ServiceItem(
        title: 'Google',
        fqdn: 'google.com',
      ),
      ServiceItem(
        title: 'Apple',
        fqdn: 'apple.com',
      ),
      ServiceItem(
        title: 'Microsoft',
        fqdn: 'microsoft.com',
      ),
      ServiceItem(
        title: 'freee',
        fqdn: 'freee.co.jp',
      ),
    ],
  ),
  MapEntry(
    ServiceCategory(name: 'Shopping'),
    <ServiceItem>[
      ServiceItem(
        title: 'Amazon',
        fqdn: 'amazon.co.jp',
      ),
      ServiceItem(
        title: 'Shopify',
        fqdn: 'shopify.com',
      ),
      ServiceItem(
        title: 'Yahoo!',
        fqdn: 'yahoo.co.jp',
      ),
      ServiceItem(
        title: 'mercari',
        fqdn: 'jp.mercari.com',
      ),
      ServiceItem(
        title: '楽天',
        fqdn: 'www.rakuten.co.jp',
      ),
    ],
  ),
  MapEntry(
    ServiceCategory(name: 'SNS'),
    <ServiceItem>[
      ServiceItem(
        title: 'Twitter',
        fqdn: 'twitter.com',
      ),
      ServiceItem(
        title: 'LINE',
        fqdn: 'line.me',
      ),
      ServiceItem(
        title: 'GitHub',
        fqdn: 'github.com',
      ),
      ServiceItem(
        title: 'Facebook',
        fqdn: 'facebook.com',
      ),
      ServiceItem(
        title: 'Instagram',
        fqdn: 'instagram.com',
      ),
      ServiceItem(
        title: 'Tiktok',
        fqdn: 'tiktok.com',
      ),
      ServiceItem(
        title: 'YouTube',
        fqdn: 'youtube.com',
      ),
    ],
  ),
];
