import 'dart:io';

import 'package:grinder/grinder_files.dart';

import '../flavor.dart';

File createConfig({
  required Flavor flavor,
  required String teamId,
}) {
  final environments = StringBuffer()
    ..writeln('APP_ID_SUFFIX=${flavor.appIdSuffix}')
    ..writeln('APP_NAME=${flavor.appName}');

  final appRoot = FilePath.current.path;
  return File('$appRoot/android/build.properties')
    ..writeAsStringSync(environments.toString())
    ..createSync();
}
