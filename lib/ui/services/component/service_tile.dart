import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

@immutable
class ServiceItem {
  const ServiceItem({
    required this.title,
    required this.subtitle,
    required this.domain,
  });

  final String title;
  final String subtitle;
  final String domain;
}

class ServiceTile extends StatelessWidget {
  const ServiceTile({
    super.key,
    required this.service,
  });

  final ServiceItem service;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 48,
        width: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: CachedNetworkImageProvider(
                'https://icon.horse/icon/${service.domain}',
              ),
            ),
          ),
        ),
      ),
      title: Text(service.title),
      subtitle: Text(service.subtitle),
      trailing: const Icon(Icons.more_vert),
    );
  }
}
