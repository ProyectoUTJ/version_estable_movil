// ignore: file_names
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:inicioflutter/theme/theme.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';
 
class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  St createState() => St();
}

class St extends State<Second> {
  String? _qrInfo = 'No hay información';
  bool camState = false;

  qrCallback(String? code) {
    setState(()  {
      camState = false;
      _qrInfo = code;
      
      
    });
    
  }
  



  @override
  void initState() {
    super.initState();
    setState(() {
      camState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final reps =Provider.of<InserVh>(context);
    InserVh mirar=context.watch<InserVh>();

    ChangeNotifierProvider(
      create: (_)=>InserVh()
      );
    
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:FloatingActionButton(
            onPressed: () {              

              
              if (camState == true) {
                setState(() {
                  camState = false;
                });
              } else {
                setState(() {
                  camState = true;
                });
              }
            },
            child: const Icon(Icons.camera),
          ),
      body: camState
          ? Center(
              child: SizedBox(
                height: 1000,
                width: 500,
                child: QRBarScannerCamera(
                  onError: (context, error) => Text(
                    error.toString(),                    
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  qrCodeCallback: (code) {
                    qrCallback(code);
                  },
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [                  
                  Text(
                    "Informacion del Automovil:            "
                    "${_qrInfo!}",
                    
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  ElevatedButton(
                      style:ButtonStyle (
                        
                    backgroundColor: MaterialStateProperty.all<Color>(AppTheme.primary),
                    ),
                    
                      onPressed: (){

                      int idvehiculo=6;
                      reps.consulta(idvehiculo);
                      if(mirar.isdata==false){
                        displayDialog(context);
                      }else{
                        displayBien(context);
                      }
                      //Navigator.of(context).pop();
                      //Navigator.pop(context, 'seleccion');
                      if (camState == true) {
                      setState(() {
                      camState = false;
                      });
                      } else {
                      setState(() {
                      camState = true;
                      });
                      }
                    },
                      child: const SizedBox(
                     width: double.infinity,
                      child: Center(child: Text('Aceptar'))
                    )
                    ),
                ],
              ),
            ),
            
    );
  }
  void displayDialog(BuildContext context) {
    
    showDialog(
      barrierDismissible: true,
      context: context,
     builder:(context){
      return Center(
        child: AlertDialog(
          title: const Text('mensaje'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15)),
          elevation: 5,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Lleva este vehiculo al taller'),
              SizedBox(height: 20,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.popAndPushNamed(context, 'loginv'),
              child: const Text('salir'))
          ],
        ),
      );
     } 
     );
  }
  void displayBien(BuildContext context) {
    
    showDialog(
      barrierDismissible: true,
      context: context,
     builder:(context){
      return Center(
        child: AlertDialog(
          title: const Text('mensaje'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15)),
          elevation: 5,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Listo estas asignado a tu vehiculo'),
              SizedBox(height: 20,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.popAndPushNamed(context, 'loginv'),
              child: const Text('salir'))
          ],
        ),
      );
     } 
     );
  }
}