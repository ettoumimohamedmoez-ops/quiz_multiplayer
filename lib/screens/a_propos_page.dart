import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'home_page.dart';


  class AProposPage extends
  StatelessWidget {
    const AProposPage({super.key});


    @override
    Widget build(BuildContext context){
      return Scaffold(
        body:Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(center: Alignment(0,-0.35),
            radius: 1.1,
            colors: [
              Color(0xFF430078),
              Color(0xFF19002F),
              Color(0xFF100020),
            ],
           ),
          ),
          child:SafeArea(child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed:() {
                Navigator.pop(context);
                },
                  icon: const Icon(Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
               ),
              ),
              const SizedBox(height: 40) ,
              const Icon(Icons.quiz,color: Color(0xFFE58BFF),
              size: 85,
              ),
              const Text('QUIZ MULTIJOUEUR',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              
             ),
             const SizedBox(height: 15),
             const Text('Une expérience de quiz amusante'
             'pour jouer et défier tes amis !',
             textAlign: TextAlign.center,
             style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              ),
             ),
             const SizedBox(height: 30),
             const Text('Version 1.0.0',
             style: TextStyle(color: Colors.white,
             fontSize: 17,
              ),
             ),
             const SizedBox(height: 15),
             const Text('Développé avec Flutter & Dart',
             style: TextStyle(color:Colors.white70,
             fontSize: 15,
              ),
             ),
            ],
          ),
         ),
        ),
      ),
      );
    }
  }