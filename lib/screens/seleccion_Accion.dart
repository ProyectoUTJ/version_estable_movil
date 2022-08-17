import 'package:inicioflutter/theme/theme.dart';
import 'package:inicioflutter/widgets/widget.dart';
import 'package:flutter/material.dart';


class Accionapp extends StatelessWidget {
   
  const Accionapp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppTheme.primary,
      //appBar: AppBar(
      //  title:const Text('Vehiculo',textAlign:TextAlign.center,),
      //  backgroundColor: AppTheme.primary,
      //),
      body:ListView(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        children: const [
          SizedBox(height: 20),
          Cars2(
            imagenURL: 'https://cdn-icons-png.flaticon.com/512/4856/4856471.png',            
            texImg:'Selecciona tu vehiculo',
            ruta: 'lectorQR',
            ),
          SizedBox(height: 20),

          Cars2(
            imagenURL: 'https://cdn-icons-png.flaticon.com/512/4661/4661996.png',
            texImg:'Ingresa combustible',
            ruta: 'kilometros',
            ),
            SizedBox(height: 20),

            Cars2(
            imagenURL: 'https://cdn-icons-png.flaticon.com/512/3094/3094700.png',
            texImg:'Cerrar sesion',
            ruta: 'loginv',
            ),
            SizedBox(height: 20),
          
          
        ],
      ),
    );
  }
}

