import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset('lib/images/logo.png', height: 240, color: Colors.black, ),
              ),

              //space inbetween
              const SizedBox( height: 48,),

              //title
              const Text(
                "Just Do it",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //space inbetween
              const SizedBox(height: 24,),

              //subtitle
              const Text(
                "Brand new Sneakers and custom kicks made with premium quality",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),

              //space inbetween
              const SizedBox(height: 48,),

              //start now button
              GestureDetector(
                onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      "Shop Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,


                      ),
                      ),
                  ),
                  ),
              )


            ],
          ),
        ),
      ) ,

    );
  }
}
