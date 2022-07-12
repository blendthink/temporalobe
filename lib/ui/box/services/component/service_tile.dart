import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

@immutable
class ServiceItem {
  const ServiceItem({
    required this.title,
    required this.fqdn,
  });

  final String title;
  final String fqdn;
}

class ServiceTile extends StatelessWidget {
  const ServiceTile({
    super.key,
    required this.service,
  });

  final ServiceItem service;

  @override
  Widget build(BuildContext context) {
    const leadingSize = 24.0;
    return ListTile(
      leading: SizedBox.square(
        dimension: leadingSize,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl:
              'http://www.google.com/s2/favicons?domain=${service.fqdn}&sz=64',
          errorWidget: (context, url, error) => const Icon(
            Icons.hide_image_outlined,
            size: leadingSize,
          ),
        ),
      ),
      title: Text(service.title),
      trailing: const Icon(Icons.more_vert),
      onTap: () {
        // TODO(blendthink): go to detail page.
      },
    );
  }
}
