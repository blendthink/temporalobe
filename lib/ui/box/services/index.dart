import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:temporalobe/ui/box/services/component/category_filter.dart';
import 'package:temporalobe/ui/box/services/component/search_app_bar.dart';
import 'package:temporalobe/ui/box/services/component/service_tile.dart';

class ServicesPage extends HookConsumerWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Theme.of(context);
    return Scaffold(
      appBar: SearchAppBar(
        onSearch: (text) {
          log(text);
        },
      ),
      body: Column(
        children: [
          CategoryFilter(
            onFilter: (category) {
              log(category.toString());
            },
            categories: const [
              'Work',
              'Shopping',
              'SNS',
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return ServiceTile(service: service);
              },
            ),
          )
        ],
      ),
    );
  }
}

const services = <ServiceItem>[
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
];
