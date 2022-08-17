

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../ui/input_decoration.dart';

class OlvidoC extends StatelessWidget {
  const OlvidoC ({Key? key}) : super(key: key);

  
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
            Text('Se envio un correo con tu contraseña'),
            SizedBox(height: 20,)
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.popAndPushNamed(context, 'loginv'),
            child: const Text('salir'))
        ],
      );
     } 
     );
  }

  @override
  Widget build(BuildContext context) { 

    final size = MediaQuery.of(context).size;  
     
    return  Scaffold(
      body: SizedBox(
       width:double.infinity,
        height:double.infinity,
        child:Stack(
          children:[
            fondodecolor(size),
            iconodelogin(),
            formulariodelogin(context),
         ],
        ),// Stack
     ),
    );    
  }
  SingleChildScrollView formulariodelogin(BuildContext context) {
   return SingleChildScrollView(    
     child: Column(      
              children: [
                const SizedBox(height: 250),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  //height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                        BoxShadow(
                        color:Colors.black12,
                        blurRadius: 15,
                        offset: Offset(2,5),
                      )
                    ]),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),//separacion
                      Text('Olvido de contraseña',
                        style: Theme.of(context).textTheme.headline6),
                      const SizedBox(height: 30),//separacion
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              autocorrect: false,
                              decoration: InputDecorations.authInputDecoration(
                                 hintText: 'ejemplo@gmail.com', 
                                 labelText: 'Ingresa correo',
                                 prefixIcon: Icons.alternate_email_rounded
                                 ),                                
                            ),                            //separacion
                            
                            const SizedBox(height: 30),//separacion
                            
                            MaterialButton (
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                            disabledColor: Colors.grey,
                            color: const Color.fromARGB(255, 55, 55, 55),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 15),
                              child: const Text('Aceptar',
                              style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed: () => {
                              displayDialog(context)
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ),
                const SizedBox(height: 50), //separacion
                const Text('Si no recuerdas tu correo ponte en contacto con el administrador de tu empresa, el podra resolver tu problema.',
                style: TextStyle(fontSize:18, fontWeight: FontWeight.bold),    
                textAlign: TextAlign.center,         
                )
              ],
            ),
            
   );
 }
 SafeArea iconodelogin() {
   return SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              width: double.infinity,
              child: const Icon(
                Icons.person_pin,
               color:Colors.white,
               size:100
              ),  // Icon
              ),
          );
 }


  Container fondodecolor(Size size) {
   return Container(
            decoration:const BoxDecoration(
                gradient: LinearGradient (colors: [
              Color.fromARGB(255, 144, 144, 144),
              Color.fromARGB(255, 2, 2, 2),
        ])),// LinearGradient // BoxDecoration
           width:double.infinity,
          height:size.height * 0.4,
          child: Stack(
            children: [
              Positioned(top:90, left:30, child: burbuja()),
              Positioned(top:-40, left:-30, child: burbuja()),
              Positioned(top:-50, right:-20, child: burbuja()),
              Positioned(bottom:-50, left:10, child: burbuja()),
              Positioned(bottom:120, right:20, child: burbuja()),
            ],
          ),
         );
 }

 Container burbuja() {
   return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromRGBO(255, 255, 255, 0.05)),
              );
  }
}