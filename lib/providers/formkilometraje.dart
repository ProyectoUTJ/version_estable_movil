import 'package:flutter/material.dart';
import 'package:inicioflutter/models/consumovehiculo.dart';

import 'package:mysql1/mysql1.dart';

import '../models/models.dart';
 
class Formukilo extends ChangeNotifier{

  GlobalKey<FormState> formKeyss =  GlobalKey<FormState>();
  
  List<Consumo> consumosdevehiculos =[];

  bool isloadin=true;
  
  int conductorid = 9;
  
  int kilometraje = 601;

  int cargacombus = 30;
  
  double costo = 23;

  int estado=0;

  Formukilo(){
    debugPrint('consulta kilometraje insercion');
    getasigconductor(conductorid, kilometraje, cargacombus,costo);
  }
  
 
  
  

  getasigconductor(int conductorid, int kilometraje,int cargacombus, double costo)async{
    try {
      var conn= await MySqlConnection.connect(ConnectionSettings(      
        host: '192.168.100.18',
        port: 3306,
        user: 'aversi',
        db: 'flotillam',
        password:'123noe'
        ));
        final busqueda = await conn.query(
        "select * from vehiculo where conductor=?",
        [conductorid]);
        if (busqueda.isNotEmpty) {
          for (var row in busqueda) {
            var idVehiculos=row[0];
            //var marca=row[1];
            //var age=row[2];
            //var nombre=row[3];
            //var placas=row[4];
            //var capcombustible=row[5];
            //var tipcombustible=row[6];
            //var tipvehiculo=row[7];
            int kilometrajes=row[8];
            //var codigoQr=row[9];
            //var empresa=row[10];
            //var conductor=row[11];
            debugPrint(idVehiculos.toString());
            
            
            if(kilometrajes<kilometraje){

              double consumo=((kilometraje-kilometrajes)/cargacombus);
              debugPrint("$consumo");

              
              getactualizavehiculo(idVehiculos, kilometraje);
              
              actualizaconsumo(cargacombus, consumo, costo, idVehiculos);
              }else{
                debugPrint('el kilometraje es inferior o el mismo');
                estado=1;
                notifyListeners();
              }
           
          }

          await conn.close(); 
        }else{
          debugPrint('no estas asignado a un vehiculo');
          estado=2;
          await conn.close(); 
        }
    } catch (e) {
      debugPrint('error en getasigconductor $e');
      estado=3;
    }
  }
  

  

  getactualizavehiculo(int idvehiculo, int kilometraje) async{
    try {
      var conn= await MySqlConnection.connect(ConnectionSettings(      
        host: '192.168.100.18',
        port: 3306,
        user: 'aversi',
        db: 'flotillam',
        password:'123noe'
        ));
        final actualizavehiculo = await conn.query(
          "UPDATE vehiculo a  SET a.kilometraje=? WHERE a.id_vehiculo=?;",
          [kilometraje, idvehiculo]
        );

          debugPrint('se actualizo el vehiculo');   
          
        await conn.close(); 
    } catch (e) {
      debugPrint('error al avtualizar vehiculo');
      estado=4;
    }
  }

  actualizaconsumo(int cargacombus,double consumo,double costo,int idvehiculo )async{
    try {
      var conn= await MySqlConnection.connect(ConnectionSettings(      
        host: '192.168.100.18',
        port: 3306,
        user: 'aversi',
        db: 'flotillam',
        password:'123noe'
        ));
        final llenadoconsumo= await conn.query(
          "INSERT INTO `consumo`(`Cargcombus`, `consumo`, `costo`, `vehiculo`) VALUES (?,?,?,?);",
          [cargacombus,consumo,costo,idvehiculo]
        );
        
          debugPrint("se inseto datos");
          for (var row in llenadoconsumo){
            final data=row;
            final llenado=Consumo.fromMap(data.fields);
            consumosdevehiculos.add(llenado);
            isloadin=false;
            notifyListeners();
            return consumosdevehiculos;   
            
          }
        


      
    } catch (e) {
      debugPrint('error dentro del consumo');
      estado=3;
    }
  }
}