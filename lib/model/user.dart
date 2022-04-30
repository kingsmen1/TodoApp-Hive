import 'package:hive/hive.dart';

// we initially uses part because of what comes next so when the build runner happen it will
//generate data adapters to add or remove data from this class. by typing
//flutter pub run build_runner build in terminal .
part 'user.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject{
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String password;

  User(this.username, this.password);
}
