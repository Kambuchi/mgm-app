
import 'package:mgm/app/domain/inputs/sign_up.dart';
import 'package:mgm/app/domain/responses/sign_up_response.dart';

abstract class SignUpRepository {
  Future<SignUpResponse> register(SignUpData data);
}
