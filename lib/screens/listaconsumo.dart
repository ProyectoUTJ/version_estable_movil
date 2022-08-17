import 'package:flutter/material.dart';
import 'package:inicioflutter/theme/theme.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/provider.dart';

class Listconsumo extends StatelessWidget {

  final Consumo? consumo;


  final opcioneslis = const [
    "dcsdcs"
    ];

  const Listconsumo({
    super.key, 
    required this.consumo
    });  
  
  @override
  Widget build(BuildContext context) {

    //obtener el provider
    final resprovider= Provider.of<Consumores>(context);
    final resp=resprovider.gettotal(resprovider.idConsumo);
    print(resp);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: const Text('Historial Consumo'),
      ),
      body: ListView.separated(
        
        itemBuilder: (context, index) => ListTile(
          title: Text(opcioneslis[index]),
          trailing: const Icon(Icons.arrow_circle_down_sharp),
          onTap: () {
            final list = opcioneslis[index];
            print(list);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 10
          )
    );
  }
}