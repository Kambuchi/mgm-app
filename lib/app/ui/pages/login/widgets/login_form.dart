import 'package:flutter/material.dart';
import 'package:mgm/app/ui/global_utils/dialogs.dart';
import 'package:mgm/app/ui/global_utils/responsive.dart';
import 'package:mgm/app/ui/global_widgets/input_text.dart';
import 'package:mgm/app/ui/pages/login/controller/login_provider.dart';
import 'package:mgm/app/ui/global_widgets/rounded_button.dart';
import 'package:mgm/app/ui/routes/routes.dart';
import 'package:mgm/app/domain/responses/sign_in_response.dart';

class LoginForm extends StatelessWidget {
  final controller = loginProvider.read;
  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: responsive.hp(22),
      left: responsive.isTablet ? responsive.wp(15) : responsive.wp(7.5),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? responsive.wp(60) : responsive.wp(85),
        ),
        child: Column(
          children: [
            SizedBox(
              width: Responsive(context).wp(90),
              child: InputText(
                prefixIcon: const Icon(Icons.mail_outline_rounded),
                labelText: 'Correo',
                onChanged: controller.onEmailChanged,
                validator: (text) {
                  if (text.contains('@')) return null;
                  return "Correo no válido.";
                },
              ),
            ),
            SizedBox(
              height: Responsive(context).dp(2),
            ),
            SizedBox(
              width: Responsive(context).wp(90),
              child: InputText(
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                labelText: 'Contraseña',
                obscureText: true,
                onChanged: controller.onPasswordChanged,
                validator: (text) {
                  if (text.length > 7) return null;
                  return "Correo no válido.";
                },
              ),
            ),
            SizedBox(
              height: Responsive(context).hp(1),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Responsive(context).hp(2)),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Olvidaste tu contraseña?',
                      style: TextStyle(fontSize: Responsive(context).dp(1.8)),
                    )),
              ),
            ),
            SizedBox(
              height: Responsive(context).hp(2),
            ),
            RoundedButton(
              fullWidth: false,
              label: 'Ingresar',
              onPressed: () {
                _submit(context);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Aun no tienes cuenta?',
                  style: TextStyle(fontSize: Responsive(context).dp(1.8)),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.REGISTER);
                    },
                    child: Text(
                      'Ingresa Aqui!',
                      style: TextStyle(fontSize: Responsive(context).dp(1.8)),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _submit(BuildContext context) async {
    ProgressDialog.show(context);
    await controller.submit().then((value) {
      if (value != null) {
        if (value.error != null) {
          late String errorMessage = "";
          switch (value.error) {
            case SignInError.networkRequestFailed:
              errorMessage = "Se perdió la conexión a Internet";
              break;
            case SignInError.userDisabled:
              errorMessage = "El usuario está deshabilitado";
              break;
            case SignInError.userNotFound:
              errorMessage = "No se ha encontrado el usuario";
              break;
            case SignInError.wrongPassword:
              errorMessage = "El password es incorrecto";
              break;
            case SignInError.tooManyRequests:
              errorMessage = "Demasiadas solicitudes equivocadas";
              break;
            default:
              errorMessage = "Error desconocido";
              break;
          }

          Dialogs.alert(
            context,
            title: "ERROR",
            description: errorMessage,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.HOME,
            (_) => false,
          );
        }
      }
    });
  }
}
