class CategoriaCliente {
  int idCategoriaCliente;
  String nombreC;
  String estadoC;
  String descripcionC;

  CategoriaCliente({
    this.idCategoriaCliente,
    this.nombreC,
    this.estadoC,
    this.descripcionC,
  });

  factory CategoriaCliente.fromJson(Map<String, dynamic> json) {
    return CategoriaCliente(
      idCategoriaCliente: json['idCategoriaCliente'],
      nombreC: json['nombreC'],
      estadoC: json['estadoC'],
      descripcionC: json['descripcionC'],
    );
  }
}