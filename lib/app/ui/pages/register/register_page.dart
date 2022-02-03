import 'package:flutter/material.dart';
import 'package:mgm/app/domain/responses/sign_up_response.dart';
import 'package:mgm/app/ui/global_utils/colors.dart';
import 'package:mgm/app/ui/global_utils/dialogs.dart';
import 'package:mgm/app/ui/global_utils/font_styles.dart';
import 'package:mgm/app/ui/global_utils/responsive.dart';
import 'package:mgm/app/ui/global_widgets/input_text.dart';
import 'package:mgm/app/ui/global_widgets/rounded_button.dart';
import 'package:mgm/app/ui/routes/routes.dart';
import 'controller/register_provider.dart';

class RegisterPage extends StatelessWidget {
  final controller = registerProvider.read;
  RegisterPage({Key? key}) : super(key: key);

  void _submit(BuildContext context) async {
    final isFormOk = controller.formKey.currentState!.validate();
    if (isFormOk) {
      ProgressDialog.show(context);
      final response = await controller.submit();
      if (response.error != null) {
        late String content;
        switch (response.error) {
          case SignUpError.emailAlreadyInUse:
            content = "Esta dirección de correo ya está utilizada";
            break;
          case SignUpError.weakPassword:
            content = "El password es muy débil";
            break;
          case SignUpError.networkRequestFailed:
            content = "Se perdió la conexión a Internet";
            break;
          default:
            content = "Error desconocido";
            break;
        }
        Dialogs.alert(
          context,
          title: "ERROR",
          description: content,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.HOME,
          (_) => false,
        );
      }
    } else {
      Dialogs.alert(
        context,
        title: "ERROR",
        description: "Campos no válidos",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: Responsive(context).hp(15),
                ),
                Container(
                  width: Responsive(context).wp(95),
                  padding: EdgeInsets.all(Responsive(context).dp(3)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(
                          Responsive(context).dp(5)),
                      boxShadow: const [
                        BoxShadow(blurRadius: 10, blurStyle: BlurStyle.outer)
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: Responsive(context).hp(5),
                        child: Stack(
                          children: [
                            Positioned(
                              right: -Responsive(context).hp(2.3),
                              top: -Responsive(context).hp(2.3),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                  );
                                },
                                icon: const Icon(
                                  Icons.close_sharp,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Crear Cuenta',
                        style: FontStyles.title,
                      ),
                      Text(
                        'Por favor, complete el formulario con sus datos',
                        style: FontStyles.regular,
                      ),
                      SizedBox(
                        height: Responsive(context).hp(2),
                      ),
                      SizedBox(
                        width: Responsive(context).wp(80),
                        child: InputText(
                          prefixIcon: const Icon(Icons.person_outline_sharp),
                          labelText: 'Nombre',
                          onChanged: controller.onNameChanged,
                          validator: (text) {
                            if (text.length > 3) return null;
                            return "Debe contener mas de 3 caracteres";
                          },
                        ),
                      ),
                      SizedBox(
                        height: Responsive(context).hp(2),
                      ),
                      SizedBox(
                        width: Responsive(context).wp(80),
                        child: InputText(
                          prefixIcon: const Icon(Icons.person_outline_sharp),
                          labelText: 'Apellido',
                          onChanged: controller.onLastNameChanged,
                          validator: (text) {
                            if (text.length > 3) return null;
                            return "Debe contener mas de 3 caracteres";
                          },
                        ),
                      ),
                      SizedBox(
                        height: Responsive(context).hp(2),
                      ),
                      SizedBox(
                        width: Responsive(context).wp(80),
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
                        height: Responsive(context).hp(2),
                      ),
                      SizedBox(
                        width: Responsive(context).wp(80),
                        child: InputText(
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          labelText: 'Contraseña',
                          obscureText: true,
                          onChanged: controller.onPasswordChanged,
                          validator: (text) {
                            if (text.length > 7) return null;
                            return "Contraseña no válida.";
                          },
                        ),
                      ),
                      SizedBox(
                        height: Responsive(context).hp(2),
                      ),
                      SizedBox(
                        width: Responsive(context).wp(80),
                        child: InputText(
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          labelText: 'Confirmar contraseña',
                          obscureText: true,
                          onChanged: controller.onVPasswordChanged,
                          validator: (text) {
                            if ((text == controller.state.password)) {
                              return null;
                            }
                            return "Las contraseñas no coinciden.";
                          },
                        ),
                      ),
                      SizedBox(
                        height: Responsive(context).hp(5),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Responsive(context).wp(5)),
                        child: RoundedButton(
                            onPressed: () {
                              _submit(context);
                            },
                            label: 'Registrarse'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
