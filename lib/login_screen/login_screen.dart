import 'package:flutter/material.dart';
import 'widget/bottom.dart';
import 'widget/text_form_filed.dart';
import 'widget/wave_clipper.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:const Text("Welcome !! 😊",style: TextStyle(color: Colors.white
                ,fontSize: 25,fontWeight: FontWeight.bold
            )),
            backgroundColor: Colors.blueAccent
        ),
        body:GestureDetector(
          onTap: (){
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: <Widget>[ //stack overlaps widgets
                  Opacity( //semi red clippath with more height and with 0.5 opacity
                    opacity: 0.5,
                    child: ClipPath(
                      clipper:WaveClipper(), //set our custom wave clipper
                      child:Container(
                        color:Colors.blueAccent,
                        height:170,
                      ),
                    ),
                  ),
                  ClipPath(  //upper clippath with less height
                    clipper:WaveClipper(), //set our custom wave clipper.
                    child:Container(
                        padding: const EdgeInsets.only(bottom: 80),
                        color:Colors.blueAccent,
                        height:150,
                        alignment: Alignment.center,
                        child: const Text("Register", style: TextStyle(
                          fontSize:30, color:Colors.white,
                          fontWeight: FontWeight.bold
                        ),)
                    ),
                  ),
                ],),

                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
                  child: Column(

                    children: [
                      defaultFormField(
                        iconData: Icons.person,
                        label: 'Full Name',
                        textInputType: TextInputType.name,

                      ),
                      const SizedBox(height: 10,),
                      defaultFormField(
                        iconData: Icons.email_outlined,
                        label: 'Email',
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 10,),

                      defaultFormField(
                        iconData: Icons.phone,
                        label: 'Phone',
                        textInputType: TextInputType.phone,
                      ),
                      const SizedBox(height: 10,),

                      defaultFormField(
                        iconData: Icons.lock,
                        label: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        suffix: Icons.remove_red_eye_outlined,
                        isPressed: ()=> print('Password1')
                      ),
                      const SizedBox(height: 10,),

                       defaultFormField(
                        iconData: Icons.lock,
                        label: 'Confirm Password',
                        textInputType: TextInputType.visiblePassword,
                        suffix: Icons.remove_red_eye_outlined,
                        isPressed: ()=> print('Password2')
                      ),

                      const SizedBox(height: 40,),


                      const BottomWidget(
                        colorText: Colors.white,
                        colorBottomBorder: Colors.blueAccent,
                        text: 'Create Account',
                        colorBottom: Colors.blueAccent,
                      ),

                      const SizedBox(height: 10,),

                      const BottomWidget(
                        colorText: Colors.blueAccent,
                        colorBottomBorder: Colors.blueAccent,
                        text: 'Login',
                        colorBottom: Colors.white,
                      )
                    ],
                  ),
                ),


              ],
            ),
          ),
        )
    );
  }
}