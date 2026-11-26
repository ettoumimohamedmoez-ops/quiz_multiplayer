import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'screens/home_page.dart';
import 'screens/quiz_selection_page.dart';
import 'screens/parametres_page.dart';
import 'screens/a_propos_page.dart';


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