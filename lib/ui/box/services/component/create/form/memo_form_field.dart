import 'package:flutter/material.dart';
import 'package:temporalobe/data/model/service/memo.dart';

class MemoFormField extends StatefulWidget {
  const MemoFormField({super.key, required this.onChanged});

  final ValueChanged<Memo?> onChanged;

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
      onChanged: (value) {
        final Memo? memo;
        if (value.isEmpty) {
          memo = null;
        } else {
          memo = Memo(value);
        }
        widget.onChanged(memo);
      },
    );
  }
}
