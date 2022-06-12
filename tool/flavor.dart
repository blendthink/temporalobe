enum Flavor {
  dev,
  stg,
  prd,
  ;

  static const _baseAppId = 'dev.blendthink.temporalobe';
  static const _baseAppName = 'Temporalobe';

  String get appId {
    if (this == prd) {
      return _baseAppId;
    } else {
      return '$_baseAppId.$name';
    }
  }

  String get appIdSuffix {
    if (this == prd) {
      return '';
    } else {
      return name;
    }
  }

  String get appName {
    if (this == prd) {
      return _baseAppName;
    } else {
      return '$name-$_baseAppName';
    }
  }
}
