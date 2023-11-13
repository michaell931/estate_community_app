import 'dart:async';

import 'package:estate_community_app/data_sources/auth_data_source.dart';
import 'package:estate_community_app/models/user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRepository {
  AuthRepository(this._authDataSource);
  final AuthDataSource _authDataSource;

  Future<void> signOut() async {
    _authDataSource.signOut();
  }

  Stream<UserModel?> authenticationCheck() {
    return _authDataSource.authenticationCheck().map((user) {
      if (user == null) {
        return null;
      }
      return UserModel(id: user.id, name: user.name);
    });
  }
}
