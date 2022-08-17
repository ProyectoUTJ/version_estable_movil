import 'dart:core';

import 'package:flutter/material.dart';

import 'package:mysql1/mysql1.dart';

import '../models/statusvehiculo.dart';
import '../models/vehiculosolo.dart';

class InserVh with ChangeNotifier {

  final List<Estadovehiculot> products = [];
  late Estadovehiculot selectedProduct;

  

  int get idvehiculo => 0;
  int get idconductor => 9; 
  //bool isdata=false;
  bool isdata=true;

  //bool get isdata=>_isdata;
  
  InserVh(){
    debugPrint('consulta de estado vehiculo');
    consulta(idvehiculo);
  }
  
   
  



   Future consulta( int idvehiculo)async {
    try {
      
      var conn= await MySqlConnection.connect(ConnectionSettings(      
        host: '192.168.100.18',
        port: 3306,
        user: 'aversi',
        db: 'flotillam',
        password:'123noe'
        )); 
 
        final consultaEstado = await conn.query(
        "SELECT * FROM status_vehiculo where vehiculo =? ;",
        [idvehiculo]);
        if (consultaEstado.isNotEmpty) {
          print(idvehiculo);
          for (var row in consultaEstado) {
  
            final respuesvehiculo=row;
            final llenado=Estadovehiculot.fromMap(respuesvehiculo.fields);
             products.add(llenado);
            if (llenado.estado!=1) {
              print(llenado.vehiculo);
              consultavehiculo(llenado.vehiculo,idconductor);
              isdata=true; 
              notifyListeners();
              //return products; 
            }else{
              debugPrint("salio de consulta estado por que esta enb taller");
              isdata=false;
              return isdata;
              
            }              
          }          
        }else{
          debugPrint('consulta estado esta vacio no lo encontro en la tabla');
        }  
        await conn.close();      
    } catch (e) {
      debugPrint('errorde consultaestado=$e');      
    }   
  }

  consultavehiculo(int idvehiculo,int idconductor)async{
    try {
      var conn= await MySqlConnection.connect(ConnectionSettings(      
        host: '192.168.100.18',
        port: 3306,
        user: 'aversi',
        db: 'flotillam',
        password:'123noe'
        )); 
      final consultavehiculo=await conn.query(        
        "UPDATE `vehiculo` SET `conductor`=? WHERE id_vehiculo=?;",[idconductor, idvehiculo]);
        
        if(consultavehiculo.isEmpty){
          print('se modifico el automovil');
        for (var row in consultavehiculo) {
          final consul=row;
          final v2=VehiculoDato.fromMap(consul.fields);
          notifyListeners();
          
          }
        }      
    } catch (e) {
      debugPrint("error en modificar el autopmovil$e");
    }
  }

  
}