import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'home_page.dart';
import 'quiz_editor_page.dart';


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
                        'Mes Quiz',
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
                    HomePage.actionButton(
                      context,
                      title: 'Créer un quiz',
                      icon: Icons.add_circle_outline_rounded,
                      filled: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuizEditorPage(),
                             ),
                            );
                           },
                          ),
                    
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