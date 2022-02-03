import 'package:flutter_meedu/meedu.dart';
import 'package:mgm/app/domain/repositories/authentication_repository.dart';
import 'package:mgm/app/domain/responses/sign_in_response.dart';
import 'login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState.initialState);
  String _email = '', _password = '';
  final _authenticationRepository = Get.i.find<AuthenticationRepository>();

  Future<SignInResponse?> submit() async {
   return await _authenticationRepository.signInWithEmailAndPassword(
        _email, _password);
  }

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }
}
