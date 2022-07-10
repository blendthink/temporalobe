import 'dart:io';

import 'package:danger_plugin_dart_analyze/danger_plugin_dart_analyze.dart';

void main() {
  final analyzeResultFile = File('analyze.log');
  DangerPluginDartAnalyze.processFile(analyzeResultFile);
}
