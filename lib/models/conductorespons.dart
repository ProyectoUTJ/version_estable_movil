// To parse this JSON data, do
//
//     final nuevarespuesta = nuevarespuestaFromMap(jsonString);

import 'dart:convert';

class Nuevarespuesta {
    Nuevarespuesta({
        required this.idConductor,
        required this.nombreCond,
        required this.apellidoP,
        required this.apellidoM,
        required this.telefono,
        required this.usuario,
        required this.password,
        required this.empresa,
    });
 
    int idConductor;
    String nombreCond;
    String apellidoP;
    String apellidoM;
    String telefono;
    String usuario;
    String password;
    int empresa;
 
    factory Nuevarespuesta.fromJson(String str) => Nuevarespuesta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Nuevarespuesta.fromMap(Map<String, dynamic> json) => Nuevarespuesta(
        idConductor: json["id_conductor"],
        nombreCond: json["nombre_cond"],
        apellidoP: json["apellidoP"],
        apellidoM: json["apellidoM"],
        telefono: json["telefono"],
        usuario: json["usuario"],
        password: json["password"],
        empresa: json["empresa"],
    );

    Map<String, dynamic> toMap() => {
        "id_conductor": idConductor,
        "nombre_cond": nombreCond,
        "apellidoP": apellidoP,
        "apellidoM": apellidoM,
        "telefono": telefono,
        "usuario": usuario,
        "password": password,
        "empresa": empresa,
    };
}
