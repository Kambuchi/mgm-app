
import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:intl/intl.dart';

import 'package:mgm/app/domain/models/gastos.dart';
import 'package:mgm/app/ui/global_utils/colors.dart';
import 'package:mgm/app/ui/global_utils/date_format.dart';
import 'package:mgm/app/ui/global_utils/responsive.dart';
import 'package:mgm/app/ui/pages/gastos/utils/rubro_gastos.dart';

class GastosPage extends StatefulWidget {
  const GastosPage({Key? key}) : super(key: key);

  @override
  State<GastosPage> createState() => _GastosPageState();
}

class _GastosPageState extends State<GastosPage> {
  late List<Gastos> gastosList;

  @override
  void initState() {
    super.initState();
    gastosList = [];
  }

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('###,###', 'es_PY');
    gastosList = router.arguments as List<Gastos>;
    gastosList.sort((a, b) => b.fecha.compareTo(a.fecha));
    int montoTotal = 0;
    for (var item in gastosList) {
      montoTotal += item.monto;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gastos'),
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
}
