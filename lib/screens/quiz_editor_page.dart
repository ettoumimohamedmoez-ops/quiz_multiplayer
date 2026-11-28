import 'package:flutter/material.dart';
import 'home_page.dart';

class QuizEditorPage extends StatefulWidget {
  const QuizEditorPage({super.key});

  @override
  State<QuizEditorPage> createState() => _QuizEditorPageState();
}

class _QuizEditorPageState extends State<QuizEditorPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController =
      TextEditingController();

  final List<QuizQuestion> questions = [QuizQuestion()];

  static const Color purple = Color(0xFF9D00FF);
  static const Color dark = Color(0xFF100020);

  @override
  void dispose() {
    _titleController.dispose();

    for (final question in questions) {
      question.dispose();
    }

    super.dispose();
  }

  void addQuestion() {
    setState(() {
      questions.add(QuizQuestion());
    });
  }

  void removeQuestion(int index) {
    if (questions.length == 1) return;

    setState(() {
      questions[index].dispose();
      questions.removeAt(index);
    });
  }

  void saveQuiz() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final quiz = {
      'titre': _titleController.text.trim(),
      'questions': questions.map((q) {
        return {
          'question': q.questionController.text.trim(),
          'choix': q.choices
              .map((c) => c.text.trim())
              .toList(),
          'bonne_reponse': q.correctIndex,
          'duree': q.duration.round(),
        };
      }).toList(),
    };

    Navigator.pop(context, quiz);
  }

  InputDecoration inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.white60,
      ),
      prefixIcon: Icon(
        icon,
        color: const Color(0xFFE58BFF),
      ),
      filled: true,
      fillColor: const Color(0xFF100020).withOpacity(0.65),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: purple.withOpacity(0.45),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Color(0xFFE58BFF),
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.redAccent,
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Center(
                        child: Icon(
                          Icons.edit_note_rounded,
                          color: Color(0xFFFFB900),
                          size: 70,
                          shadows: [
                            Shadow(
                              color: Colors.orange,
                              blurRadius: 30,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Center(
                        child: Text(
                          'CRÉER UN QUIZ',
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
                          'Prépare tes questions et défie tes amis !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        'INFORMATIONS DU QUIZ',
                        style: TextStyle(
                          color: Color(0xFFE58BFF),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),

                      const SizedBox(height: 15),

                      TextFormField(
                        controller: _titleController,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: inputDecoration(
                          'Titre du quiz',
                          Icons.title_rounded,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Entre le titre du quiz';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'MES QUESTIONS',
                            style: TextStyle(
                              color: Color(0xFFE58BFF),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            '${questions.length} question(s)',
                            style: const TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      ...List.generate(questions.length, (index) {
                        final q = questions[index];

                        return Container(
                          margin: const EdgeInsets.only(
                            bottom: 22,
                          ),
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: const Color(0xFF210038)
                                .withOpacity(0.85),
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: purple.withOpacity(0.65),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: purple.withOpacity(0.12),
                                blurRadius: 18,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'QUESTION ${index + 1}',
                                      style: const TextStyle(
                                        color: Color(0xFFE58BFF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  if (questions.length > 1)
                                    IconButton(
                                      onPressed: () =>
                                          removeQuestion(index),
                                      icon: const Icon(
                                        Icons.delete_outline_rounded,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              TextFormField(
                                controller: q.questionController,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                decoration: inputDecoration(
                                  'Énoncé de la question',
                                  Icons.help_outline_rounded,
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty) {
                                    return 'Entre la question';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 20),

                              const Text(
                                'LES 4 CHOIX',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 12),

                              ...List.generate(4, (choiceIndex) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 12,
                                  ),
                                  child: TextFormField(
                                    controller: q.choices[choiceIndex],
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: inputDecoration(
                                      'Choix ${choiceIndex + 1}',
                                      Icons.circle_outlined,
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Remplis ce choix';
                                      }

                                      final otherChoices = q.choices
                                          .where((c) =>
                                              c != q.choices[choiceIndex])
                                          .map((c) => c.text
                                              .trim()
                                              .toLowerCase());

                                      if (otherChoices.contains(
                                        value.trim().toLowerCase(),
                                      )) {
                                        return 'Les choix doivent être différents';
                                      }

                                      return null;
                                    },
                                  ),
                                );
                              }),

                              const SizedBox(height: 12),

                              const Text(
                                'BONNE RÉPONSE',
                                style: TextStyle(
                                  color: Color(0xFFE58BFF),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              DropdownButtonFormField<int>(
                                value: q.correctIndex,
                                dropdownColor: const Color(0xFF210038),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: inputDecoration(
                                  'Choisir la bonne réponse',
                                  Icons.check_circle_outline,
                                ),
                                items: List.generate(4, (i) {
                                  return DropdownMenuItem(
                                    value: i,
                                    child: Text('Choix ${i + 1}'),
                                  );
                                }),
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      q.correctIndex = value;
                                    });
                                  }
                                },
                              ),

                              const SizedBox(height: 22),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'DURÉE DE LA QUESTION',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${q.duration.round()} s',
                                    style: const TextStyle(
                                      color: Color(0xFFFFB900),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),

                              Slider(
                                value: q.duration,
                                min: 10,
                                max: 30,
                                divisions: 20,
                                activeColor: purple,
                                inactiveColor: Colors.white24,
                                onChanged: (value) {
                                  setState(() {
                                    q.duration = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      }),

                      HomePage.actionButton(
                        context,
                        title: 'Ajouter une question',
                        icon: Icons.add_circle_outline,
                        filled: false,
                        onTap: addQuestion,
                      ),

                      const SizedBox(height: 20),

                      HomePage.actionButton(
                        context,
                        title: 'Enregistrer le quiz',
                        icon: Icons.save_rounded,
                        filled: true,
                        onTap: saveQuiz,
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizQuestion {
  final TextEditingController questionController =
      TextEditingController();

  final List<TextEditingController> choices =
      List.generate(4, (_) => TextEditingController());

  int correctIndex = 0;
  double duration = 20;

  void dispose() {
    questionController.dispose();

    for (final choice in choices) {
      choice.dispose();
    }
  }
}