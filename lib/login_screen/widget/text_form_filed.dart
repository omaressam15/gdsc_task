
import 'package:flutter/material.dart';

Widget defaultFormField({
  //required TextEditingController controller,
  required TextInputType textInputType,
  //required Function validator,
  required String label,
  required IconData iconData,
  bool isPassword = false,
  //Function? onTap,
  IconData? suffix,
  Function()? isPressed,
  //Function? onChange,
}) =>
    TextFormField(
      //controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword,
      //onTap: onTap!(),
      onFieldSubmitted: (String value) {
      },
      //onChanged: onChange!(),
      //validator: validator(String),
      decoration: InputDecoration(
        fillColor: Color(0xfff5f3f4),
        filled: true,
        labelStyle: TextStyle(
          color: Colors.blueAccent,
        ),
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Color(0xfff5f3f4),

          )
        ) ,
        focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Color(0xfff5f3f4),

            )
        ) ,
        labelText: label,

        prefixIcon: Icon(iconData,color: Colors.blueAccent),

        suffixIcon: suffix != null
            ? InkWell(onTap: isPressed!(), child: Icon(suffix,color: Colors.blueAccent,)) : null,


      ),
    );