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
  android.createConfig(flavor: flavor, teamId: teamId);
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
