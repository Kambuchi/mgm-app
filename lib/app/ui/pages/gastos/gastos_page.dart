import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:intl/intl.dart';

import 'package:mgm/app/domain/models/gastos.dart';
import 'package:mgm/app/ui/global_utils/colors.dart';
import 'package:mgm/app/ui/global_utils/date_format.dart';
import 'package:mgm/app/ui/global_utils/font_styles.dart';
import 'package:mgm/app/ui/global_utils/responsive.dart';
import 'package:mgm/app/ui/pages/gastos/utils/rubro_gastos.dart';

class GastosPage extends StatefulWidget {
  const GastosPage({Key? key}) : super(key: key);

  @override
  State<GastosPage> createState() => _GastosPageState();
}

class _GastosPageState extends State<GastosPage> {
  String? rubro;
  List<String> rubros = [
    'ADMINISTRATIVO',
    'FIJOS',
    'RODADOS',
    'INSUMOS',
    'MANO DE OBRA',
    'SALARIAL',
    'PUBLICIDAD'
  ];
  late List<Gastos> gastosList;

  @override
  void initState() {
    super.initState();
    gastosList = [];
  }
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('###,###', 'es_PY');
    final GastosList gastos = router.arguments as GastosList;
    gastos.gastos.sort((a, b) => b.fecha.compareTo(a.fecha));
    int montoTotal = 0;
    selectRubro(null, gastos.gastos);
    for (var item in gastosList) {
      montoTotal += item.monto;
    }

    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gastos'),
        actions: [
          Center(
            child: Text(
              'Filtar',
              style: FontStyles.regular
                  .copyWith(fontSize: Responsive(context).dp(1.8)),
            ),
          ),
          DropdownButton<String?>(
            value: rubro,
            items: rubros.map(buildMenuItem).toList(),
            onChanged: (value) {
            setState(() {
              rubro = value;
            });
            inspect(rubro);
            selectRubro(rubro, []);

            } 
            
          ),
        ],
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: gastosList.length,
        itemBuilder: (_, index) {
          var hasBen = true;
          if (gastosList[index].beneficiario.isEmpty) {
            hasBen = false;
          }
          return Padding(
            padding: EdgeInsets.all(Responsive(context).dp(1)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 3,
                    blurRadius: 5,
                  ),
                  BoxShadow(
                    color: primaryColor,
                    spreadRadius: 0.5,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: ListTile(
                  leading: selectIcon(gastosList[index].rubro_gasto),
                  title: Text(hasBen
                      ? gastosList[index].beneficiario.toUpperCase()
                      : '(SIN NOMBRE) ${gastosList[index].factura}'),
                  subtitle:
                      Text("Gs. ${formatter.format(gastosList[index].monto)}"),
                  trailing: Text(dateFormat(gastosList[index].fecha)),
                  onTap: () {}),
            ),
          );
        },
      )),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(Responsive(context).dp(2.5)),
          child: Row(
            children: [
              Text('Se encontraron ${gastosList.length} registros.'),
              const Spacer(),
              Text('Total : Gs. ${formatter.format(montoTotal)}'),
            ],
          ),
        ),
      ),
    );
  }
  void selectRubro(String? rubro, List<Gastos> gastos) {
      if (rubro != null){
        final pre =
            gastosList.where((element) => element.rubro_gasto != null).toList();
        final result =
            pre.where((e) => e.rubro_gasto == rubro).toList();
        setState(() {
          gastosList = result;
        });
      }
      setState(() {
        gastosList = gastos;
      });
    }


  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
