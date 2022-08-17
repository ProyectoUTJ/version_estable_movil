import 'package:flutter/material.dart';
import 'package:inicioflutter/providers/consulta.dart';
import 'package:inicioflutter/providers/login_form_provider.dart';
import 'package:provider/provider.dart';
import 'package:inicioflutter/ui/input_decoration.dart';
import '../widgets/widget.dart';


class LoginScreenv extends StatelessWidget {
  
  const LoginScreenv({Key? key}) : super(key: key);  

  
  @override

  
  Widget build (BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox( height: 250 ),

              CardContainer(
                child: Column(
                  children: [

                    const SizedBox( height: 10 ),
                    Text('Login', style: Theme.of(context).textTheme.headline4 ),
                    const SizedBox( height: 30 ),
                    
                    ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(),
                      child: _LoginForm()
                    )
                    

                  ],
                )
              ),

              const SizedBox( height: 50 ),
              MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                            disabledColor: Colors.grey,
                            color: const Color.fromARGB(255, 55, 55, 55),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 15),
                              child: const Text('olvido de contraseña',
                              style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed: () => {
                              Navigator.pushNamed(context, 'olvido')
                              },                
              ),
              const SizedBox( height: 50 ),
            ],
          ),
        )
      )
   );
  }
}


class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [
            
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'john.doe@gmail.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email_rounded
              ),
              onChanged: ( value ) => loginForm.email = value,
              validator: ( value ) {

                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = RegExp(pattern);
                  
                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El correo es incorrecto';

              },
            ),

            const SizedBox( height: 30 ),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: ( value ) => loginForm.password = value,
              validator: ( value ) {

                  return ( value != null && value.length >= 3 ) 
                    ? null
                    : 'Este campo es obligatorio';                                    
                  
              },
            ),

            const SizedBox( height: 30 ),

            MaterialButton(
              
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: const Color.fromARGB(255, 88, 88, 88),
              onPressed: loginForm.isLoading ? null : () async {

                FocusScope.of(context).unfocus();

                //final conn =Provider.of<Conexion>(context,listen: false);
                
                if( !loginForm.isValidForm() ) return;

                loginForm.isLoading = true;

                //final String? trabajador= await conn.consulta(loginForm.email, loginForm.password);
                final trabajador= loginForm.isValidForm();
                                           

                if(loginForm.estado!=true){
                  Navigator.pushReplacementNamed(context, 'seleccion');
                }else{
                  debugPrint('trabajador');
                  displayDialog(context);
                }
                
                loginForm.isLoading = false;
              },
              child: Container(
                padding: const EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading 
                    ? 'Espere'
                    : 'Ingresar',
                  style: const TextStyle( color: Colors.white ),
                )
              )
            )

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
              Text('correo o contraseña incorrecta'),
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
}