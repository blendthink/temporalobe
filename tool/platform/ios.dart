import 'dart:io';

import 'package:grinder/grinder_files.dart';

import '../flavor.dart';

File createPlist({
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

File createConfig({
  required Flavor flavor,
  required String teamId,
  required bool isRelease,
}) {
  final environments = StringBuffer()
    ..writeln('APP_TEAM=$teamId')
    ..writeln('APP_ID=${flavor.appId}')
    ..writeln('APP_NAME=${flavor.appName}');

  if (isRelease) {
    environments
      ..writeln('APP_SIGN=iPhone Distribution')
      ..writeln('APP_MATCH_NAME=match AppStore ${flavor.appId}');
  } else {
    environments
      ..writeln('APP_SIGN=iPhone Developer')
      ..writeln('APP_MATCH_NAME=development ${flavor.appId}');
  }

  final appRoot = FilePath.current.path;
  return File('$appRoot/ios/Flutter/Build.xcconfig')
    ..writeAsStringSync(environments.toString())
    ..createSync();
}
