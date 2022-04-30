import 'package:hive/hive.dart';
import 'package:hivetodo/model/user.dart';

class AuthenticationService {
  late Box<User> _users;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox('userBox');
    await _users.clear();
    await _users.add(User("mujju", "password"));
    await _users.add(User("muddu", "password"));
  }

  Future<String?> authenticateUser(
      final String username, final String password) async {
    final success = await _users.values.any((element) =>
        element.password == password && element.username == username);
    if (success) {
      return username;
    } else {
      return null;
    }
  }
}
