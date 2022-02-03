class Facturas {
  String fecha;
  String factura;
  String? cliente_nombre;
  String detalle;
  String? cobrado;
  int monto;

  Facturas({
    required this.fecha,
    required this.factura,
    required this.cliente_nombre,
    required this.detalle,
    required this.cobrado,
    required this.monto,
  });

  factory Facturas.fromMap(Map<String, dynamic> json) {
    return Facturas(
      fecha: json['fecha'],
      factura: json['factura'],
      cliente_nombre: json['cliente_nombre'],
      detalle: json['detalle'],
      cobrado: json['cobrado'],
      monto: json['monto'],
    );
  }

  Map<String, dynamic> toMap() => {
        "fecha": fecha,
        "factura": factura,
        "cliente_nombre": cliente_nombre,
        "detalle": detalle,
        "cobrado": cobrado,
        "monto": monto,
      };
}

class FacturasList {
  final List<Facturas> facturas;

  FacturasList({required this.facturas});

  factory FacturasList.fromJson(List<dynamic> parsedJson) {
    List<Facturas> facturas = [];
    facturas = parsedJson.map((e) => Facturas.fromMap(e)).toList();

    return FacturasList(facturas: facturas);
  }
}
