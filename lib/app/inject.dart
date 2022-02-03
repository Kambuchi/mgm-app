import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';
import 'data/repositories_impl/authentication_repository_impl.dart';
import 'domain/repositories/authentication_repository.dart';

import 'data/repositories_impl/account_repository_impl.dart';
import 'data/repositories_impl/sign_up_repository_impl.dart';
import 'domain/repositories/account_repository.dart';
import 'domain/repositories/sign_up_repository.dart';

Future<void> injectDependencies() async {
  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      FirebaseAuth.instance,
    ),
  );
  Get.i.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(
      FirebaseAuth.instance,
    ),
  );
  Get.i.lazyPut<AccountRepository>(
    () => AccountRepositoryImpl(
      FirebaseAuth.instance,
    ),
  );
}
