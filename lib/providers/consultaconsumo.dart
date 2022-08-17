import 'package:flutter/cupertino.dart';
import 'package:mysql1/mysql1.dart';

import '../models/consumovehiculo.dart';

class Consumores  extends ChangeNotifier{

  int _idvehiculo=0;

  int get idConsumo{
    return _idvehiculo;
  }
  set idConsumo(int i){
    _idvehiculo=i;
    notifyListeners();
  }


  Consumores(){
    debugPrint('consulta de consumo');
    gettotal(idConsumo);
  }

  
  gettotal(int idConsumo)async{
    try {
      var conn = await MySqlConnection.connect(ConnectionSettings(
        host: '192.168.100.18',
        port: 3306,
        user: 'aversi',
        db: 'flotillam',
        password:'123noe'
      ));

      final consultaConsumo = await conn.query(
        "select * from consumo where vehiculo=?;",
        [_idvehiculo]
      );
      for (var row in consultaConsumo) {
        final data=row;
        final respuesConsumo=Consumo.fromMap(data.fields);
        notifyListeners();
        return respuesConsumo;
        
      }
      
    } catch (e) {
      debugPrint("error$e");
    }
  }

  
}