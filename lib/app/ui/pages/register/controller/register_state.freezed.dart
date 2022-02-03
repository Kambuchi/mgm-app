// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegisterStateTearOff {
  const _$RegisterStateTearOff();

  _RegisterState call(
      {String email = '',
      String password = '',
      String vPassword = '',
      String name = '',
      String lastname = '',
      String ci = '',
      bool termsOK = false}) {
    return _RegisterState(
      email: email,
      password: password,
      vPassword: vPassword,
      name: name,
      lastname: lastname,
      ci: ci,
      termsOK: termsOK,
    );
  }
}

/// @nodoc
const $RegisterState = _$RegisterStateTearOff();

/// @nodoc
mixin _$RegisterState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get vPassword => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get ci => throw _privateConstructorUsedError;
  bool get termsOK => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res>;
  $Res call(
      {String email,
      String password,
      String vPassword,
      String name,
      String lastname,
      String ci,
      bool termsOK});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  final RegisterState _value;
  // ignore: unused_field
  final $Res Function(RegisterState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? vPassword = freezed,
    Object? name = freezed,
    Object? lastname = freezed,
    Object? ci = freezed,
    Object? termsOK = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      vPassword: vPassword == freezed
          ? _value.vPassword
          : vPassword // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      ci: ci == freezed
          ? _value.ci
          : ci // ignore: cast_nullable_to_non_nullable
              as String,
      termsOK: termsOK == freezed
          ? _value.termsOK
          : termsOK // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(
          _RegisterState value, $Res Function(_RegisterState) then) =
      __$RegisterStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      String password,
      String vPassword,
      String name,
      String lastname,
      String ci,
      bool termsOK});
}

/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(
      _RegisterState _value, $Res Function(_RegisterState) _then)
      : super(_value, (v) => _then(v as _RegisterState));

  @override
  _RegisterState get _value => super._value as _RegisterState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? vPassword = freezed,
    Object? name = freezed,
    Object? lastname = freezed,
    Object? ci = freezed,
    Object? termsOK = freezed,
  }) {
    return _then(_RegisterState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      vPassword: vPassword == freezed
          ? _value.vPassword
          : vPassword // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      ci: ci == freezed
          ? _value.ci
          : ci // ignore: cast_nullable_to_non_nullable
              as String,
      termsOK: termsOK == freezed
          ? _value.termsOK
          : termsOK // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RegisterState with DiagnosticableTreeMixin implements _RegisterState {
  _$_RegisterState(
      {this.email = '',
      this.password = '',
      this.vPassword = '',
      this.name = '',
      this.lastname = '',
      this.ci = '',
      this.termsOK = false});

  @JsonKey()
  @override
  final String email;
  @JsonKey()
  @override
  final String password;
  @JsonKey()
  @override
  final String vPassword;
  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String lastname;
  @JsonKey()
  @override
  final String ci;
  @JsonKey()
  @override
  final bool termsOK;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegisterState(email: $email, password: $password, vPassword: $vPassword, name: $name, lastname: $lastname, ci: $ci, termsOK: $termsOK)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegisterState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('vPassword', vPassword))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('lastname', lastname))
      ..add(DiagnosticsProperty('ci', ci))
      ..add(DiagnosticsProperty('termsOK', termsOK));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterState &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.vPassword, vPassword) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            const DeepCollectionEquality().equals(other.ci, ci) &&
            const DeepCollectionEquality().equals(other.termsOK, termsOK));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(vPassword),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(lastname),
      const DeepCollectionEquality().hash(ci),
      const DeepCollectionEquality().hash(termsOK));

  @JsonKey(ignore: true)
  @override
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  factory _RegisterState(
      {String email,
      String password,
      String vPassword,
      String name,
      String lastname,
      String ci,
      bool termsOK}) = _$_RegisterState;

  @override
  String get email;
  @override
  String get password;
  @override
  String get vPassword;
  @override
  String get name;
  @override
  String get lastname;
  @override
  String get ci;
  @override
  bool get termsOK;
  @override
  @JsonKey(ignore: true)
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
