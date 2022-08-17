import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';


import '../models/conductorespons.dart';


class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  String email    = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool estado=false;
  
  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners();
  }

  
  bool isValidForm() {

    print(formKey.currentState?.validate());

    consulta(email, password);

    return formKey.currentState?.validate() ?? false;
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
            debugPrint('entroa loginconductor');
            Nuevarespuesta.fromMap(rescompl.fields);    
            return estado=true;                   
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
        debugPrint('entro a consultar el conductor');
        debugPrint('entro a consultar el conductor');
        notifyListeners();
      
    } catch (e) {
      debugPrint('error al consultar datos del conductor $e');
    }

  }

} 