import 'package:firebase_auth/firebase_auth.dart';
import 'package:mgm/app/domain/inputs/sign_up.dart';
import 'package:mgm/app/domain/repositories/sign_up_repository.dart';
import 'package:mgm/app/domain/responses/sign_up_response.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final FirebaseAuth _auth;
  SignUpRepositoryImpl(this._auth,);


  @override
  Future<SignUpResponse> register(SignUpData data) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
      await userCredential.user!.updateDisplayName(
        "${data.name} ${data.lastname}",
      );

      return SignUpResponse(null, userCredential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('La contraseña proporcionada es demasiado débil.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('La cuenta ya existe para ese correo electrónico.');
      }
      return SignUpResponse(parseStringToSignUpError(e.code), null);
    }
  }
}
