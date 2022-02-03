class Gastos {
  String fecha;
  String factura;
  String beneficiario;
  String? rubro_gasto;
  String detalle;
  String pagado;
  int monto;

  Gastos({
    required this.fecha,
    required this.factura,
    required this.beneficiario,
    required this.rubro_gasto,
    required this.detalle,
    required this.pagado,
    required this.monto,
  });

  factory Gastos.fromMap(Map<String, dynamic> json) {
    return Gastos(
      fecha: json['fecha'],
      factura: json['factura'],
      beneficiario: json['beneficiario'],
      rubro_gasto: json["rubro_gasto"],
      detalle: json['detalle'],
      pagado: json['pagado'],
      monto: json['monto'],
    );
  }

  Map<String, dynamic> toMap() => {
        "fecha": fecha,
        "factura": factura,
        "beneficiario": beneficiario,
        "rubro_gasto": rubro_gasto,
        "detalle": detalle,
        "pagado": pagado,
        "monto": monto,
      };

}

class GastosList {
  final List<Gastos> gastos;

  GastosList({required this.gastos});

  factory GastosList.fromJson(List<dynamic> parsedJson) {
    List<Gastos> gastos = [];
    gastos = parsedJson.map((e) => Gastos.fromMap(e)).toList();

    return GastosList(gastos: gastos);
  }
}
