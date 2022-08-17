import 'package:flutter/material.dart';

class AlerMScreen extends StatelessWidget {
   
  const AlerMScreen ({Key? key}) : super(key: key);

  void displayDialog(BuildContext context) {
    
    showDialog(
      barrierDismissible: true,
      context: context,
     builder:(context){
      return AlertDialog(
        title: const Text('mensaje'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15)),
        elevation: 5,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('este es el contenido del dialogo'),
            SizedBox(height: 20,),
            FlutterLogo(size: 100,),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('salir'))
        ],
      );
     } 
     );
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(        
         child: Padding(
           padding: const EdgeInsets.all(10),
           child: ElevatedButton(
            child: const Text('mostrar alerta',
            style: TextStyle(fontSize: 25)
            ),
            onPressed: () => displayDialog(context),
            ),
         ),
      ),
      floatingActionButton: FloatingActionButton(        
        child: const Icon(Icons.message_sharp),
        onPressed: (){

        }
        ),
    );
  }
}