import 'package:flutter/material.dart';

class DialogCheckNetwork extends StatelessWidget {
  const DialogCheckNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
            Color(0xFFB83AF3),
            Color(0xFF6950FB),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )
        ),
        child: Center(child: Card(
          color: Colors.white,
          child: SizedBox(
            height:MediaQuery.of(context).size.height*0.27,
            width: MediaQuery.of(context).size.width*0.89,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.wifi_off_outlined,size:120,color: Colors.red,),
                const Text('Error Connection',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                const Text('Please Check your internet',textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 20),),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
