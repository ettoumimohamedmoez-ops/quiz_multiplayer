import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Multijoueur',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color purple = Color(0xFF9D00FF);
  static const Color dark = Color(0xFF100020);

  void showMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFF210038),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(
            color: purple.withOpacity(0.7),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.construction_rounded,
                color: Color(0xFFFFB900),
                size: 55,
              ),
              const SizedBox(height: 18),
              const Text(
                'COMING SOON!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: purple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: purple),
                ),
                child: const Text(
                  'UNDER MAINTENANCE',
                  style: TextStyle(
                    color: Color(0xFFE58BFF),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Compris'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
                child: glowCircle(220),
              ),
              Positioned(
                bottom: -80,
                right: -70,
                child: glowCircle(200),
              ),

              // RESPONSIVE DESIGN
              LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: constraints.maxWidth,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 15,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Settings
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const
                                  ParametresPage(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              // Trophy illustration
                              SizedBox(
                                height: 245,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 220,
                                      height: 220,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: purple.withOpacity(0.45),
                                            blurRadius: 90,
                                            spreadRadius: 20,
                                          ),
                                        ],
                                      ),
                                    ),

                                    const Positioned(
                                      top: 0,
                                      child: Icon(
                                        Icons.emoji_events_rounded,
                                        size: 175,
                                        color: Color(0xFFFFB900),
                                        shadows: [
                                          Shadow(
                                            color: Colors.orange,
                                            blurRadius: 35,
                                          ),
                                        ],
                                      ),
                                    ),

                                    const Positioned(
                                      bottom: 5,
                                      right: 65,
                                      child: Icon(
                                        Icons.sports_esports_rounded,
                                        size: 85,
                                        color: Color(0xFFB65AFF),
                                      ),
                                    ),

                                    const Positioned(
                                      top: 60,
                                      left: 15,
                                      child: Icon(
                                        Icons.help_outline,
                                        size: 55,
                                        color: Color(0xFFDA5CFF),
                                      ),
                                    ),

                                    const Positioned(
                                      top: 75,
                                      right: 10,
                                      child: Icon(
                                        Icons.help_outline,
                                        size: 55,
                                        color: Color(0xFFDA5CFF),
                                      ),
                                    ),

                                    const Positioned(
                                      bottom: 20,
                                      left: 65,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 35,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Logo
                              const Text(
                                'QUIZ',
                                style: TextStyle(
                                  fontSize: 65,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 3,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: purple,
                                      blurRadius: 25,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                              ),

                              const Text(
                                'MULTIJOUEUR',
                                style: TextStyle(
                                  fontSize: 31,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFFE58BFF),
                                  letterSpacing: 1,
                                  shadows: [
                                    Shadow(
                                      color: purple,
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 25),

                              const Text(
                                'Teste tes connaissances\net joue avec tes amis !',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  height: 1.5,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 45),

                              // Create game
                              actionButton(
                                context,
                                title: 'Créer une partie',
                                icon: Icons.play_arrow_rounded,
                                filled: true,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const
                                    QuizSelectionPage(),
                                ),
                              );
                            },
                          ),
                              const SizedBox(height: 22),

                              // Join game
                              actionButton(
                                context,
                                title: 'Rejoindre une partie',
                                icon: Icons.groups_rounded,
                                filled: false,
                                onTap: () => showMessage(
                                  context,
                                  'Rejoindre une partie bientôt disponible',
                                ),
                              ),

                              const SizedBox(height: 65),

                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.workspace_premium,
                                    color: Color(0xFFDA5CFF),
                                    size: 28,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Bonne chance !',
                                    style: TextStyle(
                                      color: Color(0xFFDA5CFF),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 35),
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

  static Widget glowCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: purple.withOpacity(0.15),
        boxShadow: [
          BoxShadow(
            color: purple.withOpacity(0.35),
            blurRadius: 80,
            spreadRadius: 20,
          ),
        ],
      ),
    );
  }

  static Widget actionButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required bool filled,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 78,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          gradient: filled
              ? const LinearGradient(
                  colors: [
                    Color(0xFFD000FF),
                    Color(0xFF7800FF),
                  ],
                )
              : null,
          border: filled
              ? null
              : Border.all(
                  color: const Color(0xFFD000FF),
                  width: 2,
                ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFAA00FF).withOpacity(0.35),
              blurRadius: 18,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(45),
            onTap: onTap,
            child: Row(
              children: [
                const SizedBox(width: 22),
                Icon(icon, color: Colors.white, size: 36),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 21,
                ),
                const SizedBox(width: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class QuizSelectionPage extends StatelessWidget {
  const QuizSelectionPage({super.key});

  static const Color purple = Color(0xFF9D00FF);
  static const Color dark = Color(0xFF100020);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
                child: HomePage.glowCircle(220),
              ),
              Positioned(
                bottom: -80,
                right: -70,
                child: HomePage.glowCircle(200),
              ),

              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Retour
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Center(
                      child: Icon(
                        Icons.emoji_events_rounded,
                        color: Color(0xFFFFB900),
                        size: 75,
                        shadows: [
                          Shadow(
                            color: Colors.orange,
                            blurRadius: 30,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Center(
                      child: Text(
                        'PRÉPARER UNE PARTIE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          shadows: [
                            Shadow(
                              color: purple,
                              blurRadius: 20,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Center(
                      child: Text(
                        'Choisis un quiz pour commencer !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),

                    const Text(
                      'MES QUIZ',
                      style: TextStyle(
                        color: Color(0xFFE58BFF),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Espace des quiz
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: const Color(0xFF210038).withOpacity(0.85),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: purple.withOpacity(0.6),
                        ),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.quiz_rounded,
                            color: Color(0xFFDA5CFF),
                            size: 50,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Aucun quiz disponible',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            'Tes quiz apparaîtront ici.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Importer PDF
                    HomePage.actionButton(
                      context,
                      title: 'Importer PDF +',
                      icon: Icons.picture_as_pdf_rounded,
                      filled: true,
                      onTap: () => HomePage().showMessage(
                        context,
                        'Importation PDF bientôt disponible',
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Générer avec IA
                    HomePage.actionButton(
                      context,
                      title: 'Générer avec IA',
                      icon: Icons.auto_awesome,
                      filled: false,
                      onTap: () => HomePage().showMessage(
                        context,
                        'Génération des quiz avec IA bientôt disponible',
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Salle d'attente
                    HomePage.actionButton(
                      context,
                      title: 'Salle d’attente',
                      icon: Icons.groups_rounded,
                      filled: false,
                      onTap: () => HomePage().showMessage(
                        context,
                        'Salle d’attente bientôt disponible',
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Commencer
                    HomePage.actionButton(
                      context,
                      title: 'Commencer',
                      icon: Icons.play_arrow_rounded,
                      filled: true,
                      onTap: () => HomePage().showMessage(
                        context,
                        'Lancement de la partie bientôt disponible',
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
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