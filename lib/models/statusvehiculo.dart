// To parse this JSON data, do
//
//     final estadovehiculot = estadovehiculotFromJson(jsonString);
 
import 'dart:convert';

Estadovehiculot estadovehiculotFromJson(String str) => Estadovehiculot.fromMap(json.decode(str));

String estadovehiculotToJson(Estadovehiculot data) => json.encode(data.toJson());
 
class Estadovehiculot {
    Estadovehiculot({
        required this.idStatus,
        required this.vehiculo,
        required this.estado,
    });

    int idStatus;
    int vehiculo;
    int estado;

    factory Estadovehiculot.fromMap(Map<String, dynamic> json) => Estadovehiculot(
        idStatus: json["id_status"],
        vehiculo: json["vehiculo"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id_status": idStatus,
        "vehiculo": vehiculo,
        "estado": estado,
    };
}
