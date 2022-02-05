import '../pages/filter_gastos/filter_gastos_page.dart';
import '../pages/trabajos/trabajos_page.dart';
import '../pages/facturas/facturas_page.dart';
import '../pages/register/register_page.dart';
import '../pages/gastos/gastos_page.dart';
import '../pages/login/login_page.dart';
import '../pages/splash/splash_page.dart';
import 'package:flutter/widgets.dart' show BuildContext, Widget;
import 'routes.dart';
import '../pages/home/home_page.dart';

/// WARNING: generated code don't modify directly
Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.HOME: (_) => const HomePage(),
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.LOGIN: (_) => const LoginPage(),
    Routes.GASTOS: (_) => const GastosPage(),
    Routes.REGISTER: (_) => RegisterPage(),
    Routes.FACTURAS: (_) => const FacturasPage(),
    Routes.TRABAJOS: (_) => const TrabajosPage(),
    Routes.FILTER_GASTOS: (_) => const FilterGastosPage(),
  };
}
