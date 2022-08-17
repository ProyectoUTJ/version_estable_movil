import 'package:flutter/material.dart';

class AlertaScreen extends StatelessWidget {
   
  const AlertaScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text('ingresaste una ruta no definida'),
      ),
    );
  }
}