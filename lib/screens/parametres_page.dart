import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'home_page.dart';
import 'a_propos_page.dart';

class ParametresPage extends
StatelessWidget {
  const ParametresPage({super.key});

  static const Color purple=Color(0XFF9D00FF);
  static const Color dark= Color(0xFF100020);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Container(
        decoration: const
BoxDecoration(
  gradient: RadialGradient(
    center: Alignment(0, -0.35),
    radius: 1.1,
    colors: [
      Color(0xFF430078),
      Color(0xFF19002F),
      dark,
    ],
  ),
),
child: SafeArea(
  child: Stack(
    children: [
      Positioned(
        top: -80,
        left: -70,
        child:
        HomePage.glowCircle(220),
      ),
      Positioned(
        bottom: -80,
        right: -70,
        child: 
        HomePage.glowCircle(220),
      ),
      LayoutBuilder(
        builder: (context,constraints){
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: FittedBox(
              fit:BoxFit.scaleDown,
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: constraints.maxWidth,
              child:Padding(
                padding:const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 15,
                ),
                  child:Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Align(
                        alignment:
                           Alignment.topLeft ,
                        child:IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),  
                        ),
                        const SizedBox(height:20),
                        const Icon(
                          Icons.settings,
                          color: Color(0xFFE58BFF),
                          size: 75,
                          ),
                        const SizedBox(height: 15),
                        const Text('PARAMETRE',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight :FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 2,
                          shadows: [
                            Shadow(
                              color: purple,
                              blurRadius: 20,
                            )
                          ],
                         ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Personnalise ton expérience de votre jeux',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                                   fontSize: 16,
                                    color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 35),
                        ElevatedButton(
                          onPressed:() {
                            const HomePage().showMessage(context,'Profil');
                          },
                          child: const Row(children: [
                            Icon(Icons.person, color:Colors.white),
                            SizedBox(width: 15),
                            Text('Profil'),
                            Spacer(),
                            Icon(Icons.lock_clock, color:Colors.white70),
                          ],
                         ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed:() {
                            const HomePage().showMessage(context, 'Audio');
                          },
                          child: const Row(children: [
                            Icon(Icons.volume_up, color: Colors.white),
                            SizedBox(width: 15),
                            Text('Audio'),
                            Spacer(),
                            Icon(Icons.lock_clock, color:Colors.white70),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed:(){
                          const HomePage().showMessage(context, 'Théme');
                        },
                        child: const Row(children: [
                          Icon(Icons.palette, color:Colors.white),
                          SizedBox(width: 15),
                          Text('Théme'),
                          Spacer(),
                          Icon(Icons.lock_clock, color:Colors.white70),
                        ],
                      ),
                    ),
                     const SizedBox(height: 12),
                     ElevatedButton ( 
                      onPressed:() {
                        const HomePage().showMessage(context,'Langue');
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.language, color: Colors.white),
                          SizedBox(width: 15),
                          Text('Langue'),
                          Spacer(),
                          Icon(Icons.lock_clock, color: Colors.white70),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed:() {
                        const HomePage().showMessage(context,'Notifications');
                      },
                      child: const Row(children: [
                        Icon(Icons.notifications, color: Colors.white),
                        SizedBox(width: 15),
                        Text('Notifications'),
                        Spacer(),
                        Icon(Icons.lock_clock, color: Colors.white70),
                      ],
                     ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context)=> 
                           AProposPage(),
                          ),
                        );
                      },
                      child: const Row(children: [
                        Icon(Icons.info_outline,color: Colors.white),
                        SizedBox(width: 15),
                        Text('À propos'),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
                      ],
                     ),    
                    ),
                   ],
                  ),
                 ),
                ),
              ),
             );
            },
          ),
         ], 
        ),
       ),
      ),
    );
   }
  }