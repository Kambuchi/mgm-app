import 'package:flutter_meedu/meedu.dart';
import 'package:mgm/app/domain/repositories/authentication_repository.dart';
import 'package:mgm/app/ui/global_controllers/session_controller.dart';
import 'package:mgm/app/ui/routes/routes.dart';

class SplashController extends SimpleNotifier {
  SplashController(this._sessionController) {
    _init();
  }
  final SessionController _sessionController;

  final _authRepository = Get.i.find<AuthenticationRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  void _init() async {
    final user = await _authRepository.user;
    if (user != null) {
      // if(user.emailVerified == true){
      _routeName = Routes.HOME;
      _sessionController.setUser(user);
      // }else {
      //   _routeName = Routes.VERIFY_EMAIL;
      //   _sessionController.setUser(user);
      // }
    } else {
      _routeName = Routes.LOGIN;
    }
    notify();
  }

}
