import 'package:flutter/material.dart';

class AppTheme{

  static const Color primary = Color.fromARGB(255, 65, 65, 65);

  static final ThemeData claro= ThemeData.light().copyWith(
        primaryColor: const Color.fromARGB(255, 61, 61, 61),
        scaffoldBackgroundColor:const  Color.fromARGB(255, 156, 156, 156),
                
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 103, 103, 103),
          elevation: 5,          
        ),
        textButtonTheme: TextButtonThemeData(                 
          style: TextButton.styleFrom(primary: primary)          
        ),
        floatingActionButtonTheme:const FloatingActionButtonThemeData(
          backgroundColor: primary,
          elevation: 5,),
          //elevationbotton
        elevatedButtonTheme:ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 48, 48, 48),
            shape: const StadiumBorder(),
            elevation: 0,
            )
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder:  UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 34, 34, 34)
            )          
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 34, 34, 34),
            width: 2
          )
        ),
        labelStyle: TextStyle(
          color: Colors.grey
        ),
      ),

    );

  static final ThemeData oscuro= ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 52, 52, 52),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 103, 103, 103),
          elevation: 5,
        )
      );
}