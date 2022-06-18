import 'package:grinder/grinder.dart';

import 'extension/task_args_ext.dart';
import 'flavor.dart';
import 'platform/android.dart' as android;
import 'platform/ios.dart' as ios;

void main(List<String> args) => grind(args);

@Task('Create Build.xcconfig and build.properties.')
void preBuild() {
  final args = context.invocation.arguments;
  final flavor = Flavor.values.byName(args.requireOption('flavor'));
  final teamId = args.safeOption('teamId');

  ios.createConfig(flavor: flavor, teamId: teamId);
  android.createConfig(flavor: flavor);
}

@Task('Build IPA')
void buildIpa() {
  final args = context.invocation.arguments;
  final flavor = Flavor.values.byName(args.requireOption('flavor'));
  final teamId = args.requireOption('teamId');

  final plistFile = ios.createPlist(flavor: flavor, teamId: teamId);

  ios.createConfig(flavor: flavor, teamId: teamId);

  run(
    'flutter',
    arguments: [
      'build',
      'ipa',
      '--dart-define=FLAVOR=${flavor.name}',
      // https://github.com/hey24sheep/azure-flutter-tasks/issues/35
      '--export-options-plist=${plistFile.path}',
    ],
  );
}

@Task('Build AppBundle.')
void buildAab() {
  final args = context.invocation.arguments;
  final flavor = Flavor.values.byName(args.requireOption('flavor'));

  android.createConfig(flavor: flavor);

  final uploadKeyBase64 = args.requireOption('keyStoreBase64');
  final keyStoreFile =
      android.createUploadKey(uploadKeyBase64: uploadKeyBase64);

  final keyAlias = args.requireOption('keyAlias');
  final keyPassword = args.requireOption('keyPassword');
  final keyStorePassword = args.requireOption('keyStorePassword');

  android.createKeyProperties(
    keyAlias: keyAlias,
    keyPassword: keyPassword,
    keyStoreFilePath: keyStoreFile.path,
    keyStorePassword: keyStorePassword,
  );

  run(
    'flutter',
    arguments: [
      'build',
      'appbundle',
      '--dart-define=FLAVOR=${flavor.name}',
    ],
  );
}
