import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

final isarProvider =
    Provider<Isar>((ref) => throw Exception('Provider was not initialized'));
