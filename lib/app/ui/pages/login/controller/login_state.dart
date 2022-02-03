import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';
@freezed
class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState() = _LoginState;
  static LoginState get initialState => const LoginState();
}
