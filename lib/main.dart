import'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/statusvehiculo.dart';
import 'providers/provider.dart';
import 'screens/screens.dart';
void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => Conexion(),),
    ChangeNotifierProvider(create: (context) => Formukilo(),),
    ChangeNotifierProvider(create: (context) => Consumores(),),
    ChangeNotifierProvider(create: (context) => InserVh(),),
 
    ],
  child: const MyApp()));




class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'MaterialApp',
      routes:{        
        'loginv' : ( login) =>  const LoginScreenv(),
        'lectorQR':(lector) => const Lectorqr(),
        'olvido':(olvicontra)=> const OlvidoC(),
        'seleccion':(select)=> const Accionapp(),
        'consumo':(historial)=>   const Listconsumo(consumo: null,),
        'mensaje':(alerta)=>const AlerMScreen(),
        'kilometros':(forkilo)=> const KilosScreen(),        
        //'lector2':(nuescan) => Qrs2(),

      },
      initialRoute: 'loginv',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const AlertaScreen()
          );
      },
    );
 }
}

