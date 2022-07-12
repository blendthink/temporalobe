import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:temporalobe/data/model/db/scheme.dart';
import 'package:temporalobe/data/store/isar.dart';
import 'package:temporalobe/ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationSupportDirectory();
  final isar = await Isar.open(
    schemas: [
      AccountSchema,
      CategorySchema,
      FqdnSchema,
      ServiceSchema,
    ],
    directory: dir.path,
  );

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
      ],
      child: const App(),
    ),
  );
}
