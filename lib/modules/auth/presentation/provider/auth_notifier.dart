import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../repository/remote/auth_repository.dart';


class AuthNotifier extends StateNotifier<bool> {
  final AuthRepository repository;

  AuthNotifier(this.repository) : super(false) {
    checkAuth();
  }

  checkAuth() async {
    state = await repository.isAuthenticated(); //check authentication when initializing
  }

  authorize() async {
    state = true;
  }

  logout({VoidCallback? callback}) async {
    await repository.clearTokens();
    state = false;
  }
}
