import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class RootRepository {
  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  StreamSubscription<User?> Function(void Function(User? event)? onData,
      {bool? cancelOnError,
      void Function()? onDone,
      Function? onError}) authenticationCheck() {
    return FirebaseAuth.instance.authStateChanges().listen;
  }
}
