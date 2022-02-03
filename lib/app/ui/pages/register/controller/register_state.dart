import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'register_state.freezed.dart';
@freezed
class RegisterState with _$RegisterState {
   factory RegisterState({  
    @Default('') String email,
    @Default('') String password,
    @Default('') String vPassword,
    @Default('') String name,
    @Default('') String lastname,
    @Default('') String ci,
    @Default(false) bool termsOK,
    }) = _RegisterState;
  static RegisterState get initialState =>  RegisterState();
}
