import 'package:flutter/material.dart';

import 'package:flutter_meedu/router.dart' as router;
import 'package:intl/intl.dart';
import 'package:mgm/app/domain/models/facturas.dart';
import 'package:mgm/app/ui/global_utils/colors.dart';
import 'package:mgm/app/ui/global_utils/date_format.dart';
import 'package:mgm/app/ui/global_utils/font_styles.dart';
import 'package:mgm/app/ui/global_utils/responsive.dart';

class FacturasPage extends StatefulWidget {
  const FacturasPage({Key? key}) : super(key: key);

  @override
  State<FacturasPage> createState() => _FacturasPageState();
}

class _FacturasPageState extends State<FacturasPage> {
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('###,###', 'es_PY');
    final FacturasList facturas = router.arguments as FacturasList;
    facturas.facturas.sort((a, b) => b.fecha.compareTo(a.fecha));
    final facturasList = facturas.facturas;
    int montoTotal = 0;
    for (var item in facturasList) {
      if (item.cobrado == 'SI') {
        montoTotal += item.monto;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facturas'),
        actions: [
          Center(
            child: Text(
              'Filtar',
              style: FontStyles.regular
                  .copyWith(fontSize: Responsive(context).dp(1.8)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list_alt),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: facturasList.length,
        itemBuilder: (_, index) {
          var hasBen = true;
          var cobrado = false;
          if (facturasList[index].cobrado == 'SI') {
            cobrado = true;
          }
          if (facturasList[index].cliente_nombre == null) {
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
                  leading: cobrado
                      ? Icon(
                          Icons.check_circle_outline_outlined,
                          size: Responsive(context).dp(3.5),
                        )
                      : Icon(
                          Icons.cancel_outlined,
                          size: Responsive(context).dp(3.5),
                        ),
                  title: Text(hasBen
                      ? facturasList[index].cliente_nombre!.toUpperCase()
                      : '(SIN NOMBRE) ${facturasList[index].factura}'),
                  subtitle: Text(
                      "Gs. ${formatter.format(facturasList[index].monto)}"),
                  trailing: Text(dateFormat(facturasList[index].fecha)),
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
              const Spacer(),
              Text('Total Cobrado: Gs. ${formatter.format(montoTotal)}'),
            ],
          ),
        ),
      ),
    );
  }
}
