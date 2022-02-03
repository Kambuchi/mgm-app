import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

FaIcon selectIcon(String? rubro) {
  IconData _temp;
  switch (rubro) {
    case 'ADMINISTRATIVO':
      _temp = FontAwesomeIcons.userTie;
      break;
    case 'FIJOS':
      _temp = FontAwesomeIcons.crosshairs;
      break;
    case 'INSUMOS':
      _temp = FontAwesomeIcons.dolly;
      break;
    case 'MANO DE OBRA':
      _temp = FontAwesomeIcons.peopleCarry;
      break;
    case 'PUBLICIDAD':
      _temp = FontAwesomeIcons.bullhorn;
      break;
    case 'RODADOS':
      _temp = FontAwesomeIcons.shuttleVan;
      break;
    case 'SALARIAL':
      _temp = FontAwesomeIcons.moneyBill;
      break;
    default:
      _temp = FontAwesomeIcons.questionCircle;
  }
  return FaIcon(_temp);
}
