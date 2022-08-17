
import 'package:flutter/material.dart';

import '../theme/theme.dart';


class Cars2 extends StatelessWidget {
  const Cars2({Key? key, required this.imagenURL, this.texImg, required this.ruta}) : super(key: key);
  final String imagenURL;
  final String? texImg;
  final String ruta;

  @override
  Widget build(BuildContext context) {
    return Card(
      
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: const Color.fromARGB(255, 100, 100, 100),
      elevation: 10,
      child: Column(
        children:  [
            FadeInImage(
            image: NetworkImage(imagenURL),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
            ),
            if (texImg != null)
            Container(
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.only(right: 20,top:20, bottom: 20,left: 20),              
              child: ElevatedButton(
                      style:ButtonStyle (                        
                    backgroundColor: MaterialStateProperty.all<Color>(AppTheme.primary),
                    ),
                      onPressed: (){                      
                      Navigator.pushNamed(context, ruta);
                    },
                      child:  SizedBox(
                     width: double.infinity,
                     child: Center(child: Text(texImg ?? 'aceptar')
                     )
                    )
                    )

              //TextButton(onPressed: (){
                //Navigator.pushNamed(context, ruta);
              //},
              //child: Text(texImg ?? 'ingresa un nombre de la imagem'),
              //),

            ),
        ],
      ),
    );
    
  }
}