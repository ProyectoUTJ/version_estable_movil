// To parse this JSON data, do
//
//     final vehiculoDato = vehiculoDatoFromJson(jsonString);

import 'dart:convert';
 
VehiculoDato vehiculoDatoFromJson(String str) => VehiculoDato.fromMap(json.decode(str));

String vehiculoDatoToJson(VehiculoDato data) => json.encode(data.toJson());

class VehiculoDato {
    VehiculoDato({
        required this.idVehiculos,
        required this.marca,
        required this.age,
        required this.nombre,
        required this.placas,
        required this.capcombustible,
        required this.tipcombustible,
        required this.tipvehiculo,
        required this.kilometraje,
        required this.codigoQr,
        required this.empresa,
        required this.conductor,
    });

    int idVehiculos;
    String marca;
    String age;
    String nombre;
    String placas;
    int capcombustible;
    String tipcombustible;
    String tipvehiculo;
    int kilometraje;
    String codigoQr;
    int empresa;
    int conductor;

    factory VehiculoDato.fromMap(Map<String, dynamic> json) => VehiculoDato(
        idVehiculos: json["id_vehiculos"],
        marca: json["marca"],
        age: json["age"],
        nombre: json["nombre"],
        placas: json["placas"],
        capcombustible: json["Capcombustible"],
        tipcombustible: json["Tipcombustible"],
        tipvehiculo: json["Tipvehiculo"],
        kilometraje: json["kilometraje"],
        codigoQr: json["codigoQR"],
        empresa: json["empresa"],
        conductor: json["conductor"],
    );

    Map<String, dynamic> toJson() => {
        "id_vehiculos": idVehiculos,
        "marca": marca,
        "age": age,
        "nombre": nombre,
        "placas": placas,
        "Capcombustible": capcombustible,
        "Tipcombustible": tipcombustible,
        "Tipvehiculo": tipvehiculo,
        "kilometraje": kilometraje,
        "codigoQR": codigoQr,
        "empresa": empresa,
        "conductor": conductor,
    };
}
