import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../global_utils/colors.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String iconPath;
  final double size;
  final Color backgroundColor, iconColor;

  CircleButton({
    Key? key,
    required this.onPressed,
    required this.iconPath,
    this.size = 40,
    this.backgroundColor = primaryColor,
    this.iconColor = Colors.white,
  })  : assert(size > 0),
        assert(iconPath.contains(".svg")),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(10),
        decoration:
            BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
        child: SvgPicture.asset(
          iconPath,
          color: iconColor,
        ),
      ),
    );
  }
}
