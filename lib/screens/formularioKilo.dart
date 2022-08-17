// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:inicioflutter/models/models.dart';
import 'package:inicioflutter/theme/theme.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';
import '../ui/input_decoration.dart';
import '../widgets/widget.dart';
import 'screens.dart';

class KilosScreen extends StatelessWidget {
   
  const KilosScreen({Key? key}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {

    TextEditingController conbuscontroller=TextEditingController();
    TextEditingController preciocontroller=TextEditingController();
    TextEditingController kilometroscontroller=TextEditingController();
    //este es el provider
    
    //llamas si isload es true va apantalla

    

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
              Text('Listo'),
              SizedBox(height: 20,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'login'),
              child: const Text('salir'))
          ],
        ),
      );
     } 
     );
  }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: const Text('Ingresa combustible'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
          child: Form(
            //key: conecionprovider.formKey,
            child: Column(
              children: [
                TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Combustible',
                labelText: 'Ingresa combustible recargado',
                prefixIcon: Icons.car_repair_outlined
              ),
              controller: conbuscontroller,
              onChanged:(cantidadcombus){
                debugPrint(cantidadcombus);
                //conecionprovider.cargacombus.toInt();
              },              
              validator: ( cantidadcombuss ) {
                return ( cantidadcombuss != null && cantidadcombuss.length >= 3 ) 
                ? null
                : 'campo necesario';                                    
                  
              },
            ),
            
           
                 //CustomInputField(
                  // labelText: 'Combustible',
                  // hintText: 'Ingresa cantidad de combustible', 
                  // formProperty: 'first_name', 
                  // formValues: formValues 
                  // ),
                 const SizedBox( height: 30 ),

                 TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Precio',
                labelText: 'Precio por unidad de combustible',
                prefixIcon: Icons.price_change_outlined
              ),
              controller: preciocontroller,
              onChanged: ( costo ) => debugPrint(costo),//conecionprovider.costo.toDouble(),
              validator: ( value ) {

                  return ( value != null && value.length >= 3 ) 
                    ? null
                    : 'campo necesario';                                    
                  
              },
            ),
          
                 //CustomInputField( 
                  //labelText: 'Precio', 
                  //hintText: 'Precio', 
                  //formProperty: 'last_name', 
                  //formValues: formValues 
                  //),
                 const SizedBox( height: 30 ),

                 TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Kilometros',
                labelText: 'kilometros recoridos',
                prefixIcon: Icons.add_chart_sharp
              ),
              controller: kilometroscontroller,
              onChanged: ( kilometraseds ) => debugPrint(kilometraseds),//conecionprovider.kilometraje.toInt(),

              validator: ( value ) {

                  return ( value != null && value.length >= 3 ) 
                    ? null
                    : 'campo necesario';                                    
                  
              },
            ),
          
                // CustomInputField( 
                //  labelText: 'Kilometros', 
                 // hintText: 'Kilometros', 
                  //keyboardType: TextInputType.emailAddress, 
                  //formProperty: 'email', 
                  //formValues: formValues 
                  //),

                 const SizedBox( height: 30 ),


 
                 
                 ElevatedButton(
                  style:ButtonStyle (
                    backgroundColor: MaterialStateProperty.all<Color>(AppTheme.primary),
                    ),
                   child: const SizedBox(
                     width: double.infinity,
                     child: Center(child: Text('Guardar'))
                    ),
                   onPressed: () {
                    final conecionprovider=Provider.of<Formukilo>(context,listen: false);

                      FocusScope.of(context).requestFocus( FocusNode() );

                      var kiint=int.parse(kilometroscontroller.text);
                      var preint= double.parse(preciocontroller.text);
                      var conint= int.parse(conbuscontroller.text);
                      conecionprovider.getasigconductor(9, kiint, conint, preint);
                      if (conecionprovider.estado==0) {
                        debugPrint('ingresa un kilometraje actual');
                      }

                      

                      //if (resp.estado==1) {
                      //  debugPrint("ingresa un kilometraje");
                      //}

                      //for (var row in manda) {
                      //  final data=row;

                      //}
                      //if (manda) {
                        
                        
                      //}else{
                        displayDialog(context);
                      //}

                      //* imprimir valores del formulario
                      //print(manda);

                   }, 
                  )
          
              ],
            ),
          )
        ),
      )
    );
    
  }
}