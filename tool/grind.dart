import 'dart:io';

import 'package:grinder/grinder.dart';

void main(List<String> args) => grind(args);

const baseAppId = 'dev.blendthink.temporalobe';
const baseAppName = 'Temporalobe';

enum Flavor { dev, stg, prd }

@Task('Create Build.xcconfig and build.properties.')
void preBuild() {
  final args = context.invocation.arguments;
  final appTeam = args.getOption('team') ?? '';
  final appFlavor = args.getOption('flavor')!;
  final flavor = Flavor.values.byName(appFlavor);

  final String appId;
  final String appIdSuffix;
  final String appName;
  switch (flavor) {
    case Flavor.dev:
    case Flavor.stg:
      appId = '$baseAppId.$appFlavor';
      appIdSuffix = appFlavor;
      appName = '$appFlavor-$baseAppName';
      break;
    case Flavor.prd:
      appId = baseAppId;
      appIdSuffix = '';
      appName = baseAppName;
      break;
  }

  final iosEnvironments = StringBuffer()
    ..writeln('APP_TEAM=$appTeam')
    ..writeln('APP_ID=$appId')
    ..writeln('APP_NAME=$appName')
    ..writeln('APP_MATCH_NAME=match AppStore $appId');

  final appRoot = FilePath.current.path;
  File('$appRoot/ios/Flutter/Build.xcconfig')
    ..writeAsStringSync(iosEnvironments.toString())
    ..createSync();

  final androidEnvironments = StringBuffer()
    ..writeln('APP_ID_SUFFIX=$appIdSuffix')
    ..writeln('APP_NAME=$appName');

  File('$appRoot/android/build.properties')
    ..writeAsStringSync(androidEnvironments.toString())
    ..createSync();
}

// https://github.com/hey24sheep/azure-flutter-tasks/issues/35
@Task('Create ExportOptions.plist.')
void createPlist() {
  final args = context.invocation.arguments;
  final appTeam = args.getOption('team')!;
  final appFlavor = args.getOption('flavor')!;
  final flavor = Flavor.values.byName(appFlavor);

  final String appId;
  switch (flavor) {
    case Flavor.dev:
    case Flavor.stg:
      appId = '$baseAppId.$appFlavor';
      break;
    case Flavor.prd:
      appId = baseAppId;
      break;
  }
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
      <string>$appTeam</string>
      <key>uploadBitcode</key>
      <false/>
      <key>uploadSymbols</key>
      <true/>
      <key>provisioningProfiles</key>
      <dict>
        <key>$appId</key>
        <string>match AppStore $appId</string>
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
  File('$appRoot/ExportOptions.plist')
    ..writeAsStringSync(plist)
    ..createSync();
}
