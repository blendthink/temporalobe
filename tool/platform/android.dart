import 'dart:convert';
import 'dart:io';

import 'package:grinder/grinder_files.dart';

import '../flavor.dart';

File createConfig({
  required Flavor flavor,
}) {
  final environments = StringBuffer()
    ..writeln('appIdSuffix=${flavor.appIdSuffix}')
    ..writeln('appName=${flavor.appName}');

  final appRoot = FilePath.current.path;
  return File('$appRoot/android/build.properties')
    ..writeAsStringSync(environments.toString())
    ..createSync();
}

File createUploadKey({
  required String uploadKeyBase64,
}) {
  final decoded = base64.decode(uploadKeyBase64);

  final appRoot = FilePath.current.path;
  return File('$appRoot/android/upload.jks')
    ..writeAsBytesSync(decoded)
    ..createSync();
}

File createKeyProperties({
  required String keyAlias,
  required String keyPassword,
  required String keyStoreFilePath,
  required String keyStorePassword,
}) {
  final environments = StringBuffer()
    ..writeln('keyAlias=$keyAlias')
    ..writeln('keyPassword=$keyPassword')
    ..writeln('keyStoreFilePath=$keyStoreFilePath')
    ..writeln('keyStorePassword=$keyStorePassword');

  final appRoot = FilePath.current.path;
  return File('$appRoot/android/key.properties')
    ..writeAsStringSync(environments.toString())
    ..createSync();
}
