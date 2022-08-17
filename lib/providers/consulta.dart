import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';


import '../models/conductorespons.dart';

class Conexion with ChangeNotifier { 

  List<Nuevarespuesta> scan =[];
   
   String get email => '';
  
  String get password => '';
 

  Conexion(){
    debugPrint('consulta conductor');
    consulta(email, password);
  } 



   consulta( String email, String password)async {
    try {
      var conn= await MySqlConnection.connect(ConnectionSettings(      
        host: '192.168.100.18',
        port: 3306,
        user: 'aversi',
        db: 'flotillam',
        password:'123noe'
        ));
 
        final loginconductor = await conn.query(
        "SELECT * FROM conductor where usuario =? AND password=?",
        [email, password]);

        if (loginconductor.isNotEmpty) {
            for (var row in loginconductor) {
            final rescompl = row;
            Nuevarespuesta.fromMap(rescompl.fields);                       
          }
        }else{
          'error$loginconductor';
        } 
        await conn.close();      
    } catch (e) {
      debugPrint('error=$e');      
    }      
  }



dardatos(int idconductor)async{
    try {
      var conn= await MySqlConnection.connect(ConnectionSettings(      
        host: '192.168.100.18',
        port: 3306,
        user: 'aversi',
        db: 'flotillam',
        password:'123noe'
        ));

        var scan = await conn.query(
        "SELECT * FROM conductor where id_conductor?",
        [idconductor]);
        for (var row in scan) {
          scan = row as Results;
        }
        
        notifyListeners();
      
    } catch (e) {
      debugPrint('error al consultar datos del conductor $e');
    }

  }
  
}