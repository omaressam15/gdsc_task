import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
 final Color colorBottom;
 final Color colorBottomBorder;
 final Color colorText;
 final String text;

   const BottomWidget({Key? key,required this.colorText,required this.colorBottom, required this.colorBottomBorder,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: OutlinedButton(
          onPressed: (){

          },
        style: OutlinedButton.styleFrom(
          backgroundColor: colorBottom,
          fixedSize: Size(double.infinity, MediaQuery.of(context).size.height*0.05),
          shape: const StadiumBorder(
            side: BorderSide.none,
          ),
          side: BorderSide(
            width: 2,
            color: colorBottomBorder,
          )
        ),
          child: Text(text,style: TextStyle(color: colorText)),
      ),
    );
  }
}
