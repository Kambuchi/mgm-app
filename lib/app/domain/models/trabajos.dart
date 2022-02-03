class Trabajos {
  String fecha_presupuesto;
  dynamic factura;
  String? cliente_nombre;
  String descripcion;
  int status;

  Trabajos({
    required this.fecha_presupuesto,
    required this.factura,
    required this.cliente_nombre,
    required this.descripcion,
    required this.status,
  });

  factory Trabajos.fromMap(Map<String, dynamic> json) {
    return Trabajos(
      fecha_presupuesto: json['fecha_presupuesto'],
      factura: json['factura'],
      cliente_nombre: json['cliente_nombre'],
      descripcion: json['descripcion'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toMap() => {
        "fecha_presupuesto": fecha_presupuesto,
        "factura": factura,
        "cliente_nombre": cliente_nombre,
        "descripcion": descripcion,
        "status": status,
      };
}

class TrabajosList {
  final List<Trabajos> trabajos;

  TrabajosList({required this.trabajos});

  factory TrabajosList.fromJson(List<dynamic> parsedJson) {
    List<Trabajos> trabajos = [];
    trabajos = parsedJson.map((e) => Trabajos.fromMap(e)).toList();

    return TrabajosList(trabajos: trabajos);
  }
}
