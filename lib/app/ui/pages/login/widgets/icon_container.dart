import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final double size;
  const IconContainer({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size * 0.15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 8,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * 0.01),
      child: Center(
        child: Image.asset(
          'assets/img/mgm-logo.png',
          width: size * 0.9,
          height: size * 0.9  ,
        ),
      ),
    );
  }
}
