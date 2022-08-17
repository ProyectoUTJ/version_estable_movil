import 'package:flutter/material.dart';


class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    return InputDecoration(
        hintText: hintText,
        labelText: labelText,        
        prefixIcon: prefixIcon != null 
          ? Icon( prefixIcon, color: const Color.fromARGB(255, 65, 65, 65) )
          : null
      );
  }  

}