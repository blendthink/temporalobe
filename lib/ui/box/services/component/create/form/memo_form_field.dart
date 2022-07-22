import 'package:flutter/material.dart';

class MemoFormField extends StatefulWidget {
  const MemoFormField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MemoFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      minLines: 5,
      maxLines: 10,
      keyboardType: TextInputType.multiline,
      onChanged: widget.onChanged,
    );
  }
}
