import 'package:flutter_meedu/meedu.dart';
import 'package:mgm/app/ui/global_controllers/session_controller.dart';
import 'splash_controller.dart';

final splashProvider = SimpleProvider(
  (_) => SplashController(sessionProvider.read),
);
  