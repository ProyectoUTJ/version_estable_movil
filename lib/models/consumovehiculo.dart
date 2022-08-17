// To parse this JSON data, do
//
//     final consumo = consumoFromJson(jsonString);

import 'dart:convert';

Consumo consumoFromJson(String str) => Consumo.fromMap(json.decode(str));

String consumoToJson(Consumo data) => json.encode(data.toJson());

class Consumo {
    Consumo({
        this.idConsumo,
        required this.cargcombus,
        required this.consumo,
        required this.costo,
        required this.vehiculo,
    });

    int? idConsumo;
    int cargcombus;
    int consumo;
    double costo;
    int vehiculo;

    factory Consumo.fromMap(Map<String, dynamic> json) => Consumo(
        idConsumo: json["id_consumo"],
        cargcombus: json["Cargcombus"],
        consumo: json["consumo"],
        costo: json["costo"].toDouble(),
        vehiculo: json["vehiculo"],
    );

    Map<String, dynamic> toJson() => {
        "id_consumo": idConsumo,
        "Cargcombus": cargcombus,
        "consumo": consumo,
        "costo": costo,
        "vehiculo": vehiculo,
    };
}
