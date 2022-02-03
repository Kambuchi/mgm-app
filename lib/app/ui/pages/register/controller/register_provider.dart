import 'package:flutter_meedu/meedu.dart';
import 'package:mgm/app/ui/global_controllers/session_controller.dart';
import 'register_controller.dart';
import 'register_state.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(sessionProvider.read),
);
