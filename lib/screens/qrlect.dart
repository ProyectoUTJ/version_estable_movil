import 'package:flutter/material.dart';
import 'package:inicioflutter/screens/Second.dart';


 
 
class Lectorqr extends StatelessWidget{
  const Lectorqr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Qrsl createState() => Qrsl();
}

class Qrsl extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:const Color.fromARGB(255, 55, 55, 55),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.qr_code_scanner,
                  size: 40,
                ),
              ),
            ],
          ),
          title: const Text(
            'Escanea el codigo QR',
          ),
        ),
        body: const TabBarView(
          children: [ 
            Second()
          ],
        )
      ),
    );
  }
}