import 'package:flutter/material.dart';
import 'package:temporalobe/ui/box/services/component/create/uri_card.dart';

class UriCards extends StatefulWidget {
  const UriCards({super.key, required this.onChanged});

  final ValueChanged<List<Uri>> onChanged;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<UriCards> {
  final List<Uri> uris = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: uris.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return UriCard(
          onChanged: (value) {
            uris[index] = value;
            widget.onChanged(uris);
          },
        );
      },
    );
  }
}
