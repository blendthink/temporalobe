import 'dart:io';

import 'package:grinder/grinder.dart';

import 'extensions/task_args_ext.dart';
import 'flavor.dart';

void main(List<String> args) => grind(args);

@Task('Create Build.xcconfig and build.properties.')
void preBuild() {
  final args = context.invocation.arguments;
  final flavor = Flavor.values.byName(args.requireOption('flavor'));
  final teamId = args.safeOption('teamId');

  final iosEnvironments = StringBuffer()
    ..writeln('APP_TEAM=$teamId')
    ..writeln('APP_ID=${flavor.appId}')
    ..writeln('APP_NAME=${flavor.appName}')
    ..writeln('APP_MATCH_NAME=match AppStore ${flavor.appId}');

  final appRoot = FilePath.current.path;
  File('$appRoot/ios/Flutter/Build.xcconfig')
    ..writeAsStringSync(iosEnvironments.toString())
    ..createSync();

  final androidEnvironments = StringBuffer()
    ..writeln('APP_ID_SUFFIX=${flavor.appIdSuffix}')
    ..writeln('APP_NAME=${flavor.appName}');

  File('$appRoot/android/build.properties')
    ..writeAsStringSync(androidEnvironments.toString())
    ..createSync();
}

@Task('Build IPA')
void buildIpa() {
  final args = context.invocation.arguments;
  final flavor = Flavor.values.byName(args.requireOption('flavor'));
  final teamId = args.requireOption('teamId');

  final plistFile = _createPlist(flavor: flavor, teamId: teamId);

  run(
    'flutter',
    arguments: [
      'build',
      'ipa',
      '--dart-define=FLAVOR=${flavor.name}}',
      // https://github.com/hey24sheep/azure-flutter-tasks/issues/35
      '--export-options-plist=${plistFile.path}',
    ],
  );
}

File _createPlist({
  required Flavor flavor,
  required String teamId,
}) {
  final plist = '''
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
   <dict>
      <key>destination</key>
      <string>export</string>
      <key>method</key>
      <string>app-store</string>
      <key>teamID</key>
      <string>$teamId</string>
      <key>uploadBitcode</key>
      <false/>
      <key>uploadSymbols</key>
      <true/>
      <key>provisioningProfiles</key>
      <dict>
        <key>${flavor.appId}</key>
        <string>match AppStore ${flavor.appId}</string>
      </dict>
      <key>signingCertificate</key>
      <string>iPhone Distribution</string>
      <key>signingStyle</key>
      <string>manual</string>
      <key>stripSwiftSymbols</key>
      <true/>
   </dict>
</plist>
''';

  final appRoot = FilePath.current.path;
  return File('$appRoot/ExportOptions.plist')
    ..writeAsStringSync(plist)
    ..createSync();
}
