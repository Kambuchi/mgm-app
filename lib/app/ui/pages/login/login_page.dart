import 'package:flutter/material.dart';
import 'package:mgm/app/ui/global_utils/colors.dart';
import 'package:mgm/app/ui/global_utils/font_styles.dart';
import 'package:mgm/app/ui/global_utils/responsive.dart';
import 'package:mgm/app/ui/pages/login/widgets/login_form.dart';

import 'widgets/circle.dart';
import 'widgets/icon_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double pinkSize = responsive.wp(82);
    final double orangeSize = responsive.wp(65);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: responsive.height,
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    top: -pinkSize * 0.3,
                    right: -pinkSize * 0.2,
                    child: CircleBack(
                      size: pinkSize,
                      colors: const [blueColor, blueSecColor],
                    ),
                  ),
                  Positioned(
                    top: -orangeSize * 0.4,
                    left: -orangeSize * 0.2,
                    child: CircleBack(
                      size: responsive.wp(65),
                      colors: const [
                        redColor,
                        redSecColor,
                      ],
                    ),
                  ),
                  Positioned(
                    top: pinkSize * 0.48,
                    right: responsive.wp(30),
                    child: Column(
                      children: [
                        IconContainer(
                          size: responsive.wp(40),
                        ),
                        SizedBox(
                          height: responsive.dp(2.5),
                        ),
                        const Text(
                          'Bienvenido!!',
                          textAlign: TextAlign.center,
                          style: FontStyles.title,
                        )
                      ],
                    ),
                  ),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
