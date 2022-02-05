import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:http/http.dart' as http;
import 'package:mgm/app/domain/models/facturas.dart';
import 'package:mgm/app/domain/models/gastos.dart';
import 'package:mgm/app/domain/models/trabajos.dart';
import 'package:mgm/app/domain/repositories/authentication_repository.dart';
import 'package:mgm/app/ui/global_utils/font_styles.dart';
import 'package:mgm/app/ui/global_utils/responsive.dart';
import 'package:mgm/app/ui/global_widgets/rounded_button.dart';
import 'package:mgm/app/ui/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  Future<GastosList?> getGastos() async {
    setState(() {
      isLoading = true;
    });
    http.Response response =
        await http.get(Uri.parse('https://api-mgm.herokuapp.com/gastos'));
    final GastosList _gastosList;

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final data = json.decode(body);
      _gastosList = GastosList.fromJson(data);
    } else {
      setState(() {
        isLoading = false;
      });
      return null;
    }
    setState(() {
      isLoading = false;
    });
    return _gastosList;
  }

  Future<FacturasList?> getFacturas() async {
    setState(() {
      isLoading = true;
    });
    http.Response response =
        await http.get(Uri.parse('https://api-mgm.herokuapp.com/facturas'));
    final FacturasList _facturasList;

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final data = json.decode(body);
      _facturasList = FacturasList.fromJson(data);
    } else {
      setState(() {
        isLoading = false;
      });
      return null;
    }
    setState(() {
      isLoading = false;
    });
    return _facturasList;
  }

  Future<TrabajosList?> getTrabajos() async {
    setState(() {
      isLoading = true;
    });
    http.Response response =
        await http.get(Uri.parse('https://api-mgm.herokuapp.com/trabajos'));
    final TrabajosList _trabajosList;

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final data = json.decode(body);
      _trabajosList = TrabajosList.fromJson(data);
    } else {
      setState(() {
        isLoading = false;
      });
      return null;
    }
    setState(() {
      isLoading = false;
    });
    return _trabajosList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      const Spacer(),
                      Text(
                        'Lista de Reportes',
                        style: FontStyles.title,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: Responsive(context).wp(85),
                        child: RoundedButton(
                            onPressed: () {
                              getGastos().then((value) => Navigator.pushNamed(
                                  context, Routes.FILTER_GASTOS,
                                  arguments: value));
                            },
                            label: 'Gastos'),
                      ),
                      SizedBox(
                        height: Responsive(context).hp(2),
                      ),
                      SizedBox(
                        width: Responsive(context).wp(85),
                        child: RoundedButton(
                            onPressed: () {
                              getTrabajos().then((value) => Navigator.pushNamed(
                                  context, Routes.TRABAJOS,
                                  arguments: value));
                            },
                            label: 'Trabajos'),
                      ),
                      SizedBox(
                        height: Responsive(context).hp(2),
                      ),
                      SizedBox(
                        width: Responsive(context).wp(85),
                        child: RoundedButton(
                            onPressed: () {
                              getFacturas().then((value) => Navigator.pushNamed(
                                  context, Routes.FACTURAS,
                                  arguments: value));
                            },
                            label: 'Facturas'),
                      ),
                      const Spacer(),
                      RoundedButton(
                        label: 'Salir',
                        fullWidth: false,
                        onPressed: () {
                          final auth = Get.i.find<AuthenticationRepository>();
                          auth.signOut().whenComplete(() =>
                              Navigator.pushNamedAndRemoveUntil(
                                  context, Routes.SPLASH, (route) => false));
                        },
                      ),
                      SizedBox(
                        height: Responsive(context).hp(5),
                      )
                    ],
                  )),
      ),
    );
  }
}
