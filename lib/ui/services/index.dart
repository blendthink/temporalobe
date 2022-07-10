import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:temporalobe/ui/services/component/service_tile.dart';

class ServicesPage extends ConsumerWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temporalobe'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return StickyHeader(
            header: Container(
              height: 50,
              color: Colors.blueGrey[700],
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                'Header #$index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            content: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (context, index) {
                return ServiceTile(service: services[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

const services = <ServiceItem>[
  ServiceItem(
    title: 'Twitter',
    subtitle: 'blendthink',
    domain: 'twitter.com',
  ),
  ServiceItem(
    title: 'Twitter',
    subtitle: 'blendthink',
    domain: 'twitter.com',
  ),
  ServiceItem(
    title: 'Google',
    subtitle: 'blendthink',
    domain: 'google.com',
  ),
];
