import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitly/data/models/user.dart';

class UserNotifier extends Notifier<User?> {
  @override
  User? build() {
    // TODO: implement build
    return null;
  }

  void setUser(User user) {
    state = user;
  }

  void clearUser() {
    state = null;
  }
}

final userProvider = NotifierProvider<UserNotifier, User?>(() {
  return UserNotifier();
});
