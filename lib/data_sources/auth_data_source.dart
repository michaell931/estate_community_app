import 'dart:async';

import 'package:estate_community_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthDataSource {
  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Stream<UserModel?> authenticationCheck() {
    return FirebaseAuth.instance.authStateChanges().map((userFirebase) {
      if (userFirebase == null) {
        return null;
      }
      return UserModel(id: userFirebase.uid, name: userFirebase.displayName);
    });
  }
}
