import 'package:grinder/grinder.dart';

extension TaskArgsExt on TaskArgs {
  String requireOption(String name) =>
      getOption(name) ??
      fail("$name is required for command-line arguments. '--$name=xxx'.");

  String safeOption(String name, [String defaultValue = '']) =>
      getOption(name) ?? defaultValue;
}
