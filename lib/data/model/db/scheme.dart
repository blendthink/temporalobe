import 'package:isar/isar.dart';

part 'scheme.g.dart';

@Collection(accessor: 'categories')
class Category {
  final id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;
}

@Collection(accessor: 'services')
class Service {
  final id = Isar.autoIncrement;

  final category = IsarLink<Category>();

  @Index()
  late String name;

  late List<String> urls;

  late String memo;

  @Backlink(to: 'service')
  final accounts = IsarLinks<Account>();
}

@Collection(accessor: 'accounts')
class Account {
  final id = Isar.autoIncrement;

  final service = IsarLink<Service>();

  late String username;
  late String password;
  late String totp;

  @Backlink(to: 'account')
  final fields = IsarLinks<Field>();
}

@Collection(accessor: 'fields')
class Field {
  final id = Isar.autoIncrement;

  final account = IsarLink<Account>();

  late bool canObscure;
  late String key;
  late String value;
}
