import 'package:flutter/material.dart';

class Pantallacarga extends StatelessWidget {
   
  const Pantallacarga({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pantalla de carga'),
      ),
      body: const Center(
         child: CircularProgressIndicator(
          color: Colors.black87,
         ),
      ),
    );
  }
}