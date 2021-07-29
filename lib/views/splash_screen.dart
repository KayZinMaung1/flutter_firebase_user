import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: double.infinity,
              height: size.height*0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/splash.png"),
                    fit: BoxFit.cover,
                      ),
                    ),
                ),
          Container(
            width: 35,
            height: 35,
            child: CircularProgressIndicator(color: Colors.blue,),
          )
        ],
      ),
    );
  }
}