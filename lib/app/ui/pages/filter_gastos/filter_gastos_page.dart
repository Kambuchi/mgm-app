import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:mgm/app/domain/models/gastos.dart';
import 'package:mgm/app/ui/global_utils/date_format.dart';
import 'package:mgm/app/ui/global_utils/font_styles.dart';
import 'package:mgm/app/ui/global_utils/responsive.dart';
import 'package:mgm/app/ui/global_widgets/rounded_button.dart';
import 'package:mgm/app/ui/routes/routes.dart';

class FilterGastosPage extends StatefulWidget {
  const FilterGastosPage({Key? key}) : super(key: key);

  @override
  State<FilterGastosPage> createState() => _FilterGastosPageState();
}

class _FilterGastosPageState extends State<FilterGastosPage> {
  String? rubro = 'TODOS';

  List<String> rubros = [
    'TODOS',
    'ADMINISTRATIVO',
    'FIJOS',
    'RODADOS',
    'INSUMOS',
    'MANO DE OBRA',
    'SALARIAL',
    'PUBLICIDAD'
  ];

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<Gastos> gastosList = [];
  double maxValue = 0;
  double minValue = 0;

  @override
  Widget build(BuildContext context) {
    final GastosList gastos = router.arguments as GastosList;
    gastos.gastos.sort((a, b) => a.monto.compareTo(b.monto));
    maxValue = gastos.gastos.last.monto.toDouble();
    minValue = gastos.gastos.first.monto.toDouble();
    RangeValues rangedValues = const RangeValues(100000, 20000000);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Responsive(context).hp(20),
                  horizontal: Responsive(context).wp(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Filtre sus reportes',
                    style: FontStyles.title,
                  ),
                  SizedBox(
                    height: Responsive(context).hp(2),
                  ),
                  Row(
                    children: [
                      Text(
                        'Seleccionar rubro',
                        style: FontStyles.regular,
                      ),
                      const Spacer(),
                      DropdownButton<String>(
                          value: rubro,
                          items: rubros.map(buildMenuItem).toList(),
                          onChanged: (value) {
                            setState(() {
                              rubro = value;
                            });
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Seleccionar fecha',
                        style: FontStyles.regular,
                      ),
                      const Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Inicio',
                        style: FontStyles.normal,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: Responsive(context).wp(45),
                        child: ElevatedButton(
                            child: Text(dateTimeFormat(startDate)),
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.parse('2000-01-01'),
                                lastDate: DateTime.parse('2050-12-31'),
                              );
                              if (newDate != null) {
                                setState(() {
                                  startDate = newDate;
                                });
                              }
                            }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Final',
                        style: FontStyles.normal,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: Responsive(context).wp(45),
                        child: ElevatedButton(
                            child: Text(dateTimeFormat(endDate)),
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.parse('2000-01-01'),
                                lastDate: DateTime.parse('2050-12-31'),
                              );
                              if (newDate != null) {
                                setState(() {
                                  endDate = newDate;
                                });
                              }
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Responsive(context).hp(2),
                  ),
                  Row(
                    children: [
                      Text(
                        'Seleccionar Monto',
                        style: FontStyles.regular,
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: Responsive(context).hp(2),
                  ),
                  RangeSlider(
                    values: rangedValues,
                    divisions: 100000,
                    min: minValue,
                    max: maxValue,
                    labels: RangeLabels(
                      rangedValues.start.round().toString(),
                      rangedValues.end.round().toString(),
                    ),
                    onChanged: (values) {
                      setState(() {
                        rangedValues = values;
                      });
                    },
                  ),
                  SizedBox(
                    height: Responsive(context).hp(20),
                  ),
                  RoundedButton(
                    label: 'Aplicar filtros',
                    onPressed: () {
                      gastosList =
                          _filterGastos(gastos, rubro, startDate, endDate);
                      Navigator.pushNamed(context, Routes.GASTOS,
                          arguments: gastosList);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: FontStyles.normal,
        ),
      );
}

List<Gastos> _filterGastos(
    GastosList gastos, String? rubro, DateTime startDate, DateTime endDate) {
  List<Gastos> result;
  List<Gastos> temp;

  if (rubro != 'TODOS' && rubro != null) {
    temp =
        gastos.gastos.where((element) => element.rubro_gasto == rubro).toList();
  } else {
    temp = gastos.gastos;
  }

  result = temp
      .where((element) =>
          DateTime.parse(element.fecha).isAfter(startDate) &&
          DateTime.parse(element.fecha).isBefore(endDate))
      .toList();
  return result;
}
