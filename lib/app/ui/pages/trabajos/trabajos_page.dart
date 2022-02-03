import 'package:flutter/material.dart';
import 'package:mgm/app/domain/models/trabajos.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:mgm/app/ui/global_utils/colors.dart';
import 'package:mgm/app/ui/global_utils/date_format.dart';
import 'package:mgm/app/ui/global_utils/font_styles.dart';
import 'package:mgm/app/ui/global_utils/responsive.dart';

class TrabajosPage extends StatelessWidget {
  const TrabajosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TrabajosList trabajos = router.arguments as TrabajosList;
    trabajos.trabajos
        .sort((a, b) => b.fecha_presupuesto.compareTo(a.fecha_presupuesto));
    final trabajosList = trabajos.trabajos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trabajos'),
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
        itemCount: trabajosList.length,
        itemBuilder: (_, index) {
          var hasBen = true;
          if (trabajosList[index].cliente_nombre == null) {
            hasBen = false;
          }
          return Padding(
            padding: EdgeInsets.all(Responsive(context).dp(1.2)),
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
                  leading: Icon(
                    Icons.check_circle_outline_outlined,
                    size: Responsive(context).dp(3.5),
                  ),
                  title: Text(hasBen
                      ? trabajosList[index].cliente_nombre!.toUpperCase()
                      : '(SIN NOMBRE) ${trabajosList[index].factura}'),
                  subtitle: Text(trabajosList[index].descripcion),
                  trailing:
                      Text(dateFormat(trabajosList[index].fecha_presupuesto)),
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
              Text('Se encontraron ${trabajosList.length} registros.'),
              const Spacer(),
              Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
