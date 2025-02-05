import 'package:encuestas/dashboard.dart';
import 'package:encuestas/models/answer.dart';
import 'package:encuestas/questions_a.dart';
import 'package:encuestas/questions_b.dart';
import 'package:encuestas/summary.dart';
import 'package:encuestas/survey.dart';
import 'package:flutter/material.dart';
import 'models/student.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> _pages;

  final List<String> _titles = [
    'Dashboard',
    'Nueva Encuesta',
    'Datos del estudiante',
    'Encuesta',
    'Resumen',
  ];

  int _currentPage = 0;
  Student? student;
  Answer? answer;

  @override
  void initState() {
    super.initState();
    // Initialize `_pages` here when the instance is fully created
    _pages = [
      DashboardPage(), // 0
      SurveyPage(onPageChange: _changePage), // 1
      QuestionsAPage(onPageChange: _changePage), // 2
      QuestionsBPage(onPageChange: _changePage, student: student,), // 3
      SummaryPage(onPageChange: _changePage, student: student, answer: answer), // 4
    ];
  }

  void _changePage (int pageIndex, [Student? student, Answer? answer]){
    setState(() {
       _currentPage = pageIndex;

      if (student != null) {
        student = student;

        if(answer != null){
          answer = answer;
          // Actualiza la página de SummaryPage con el nuevo estudiante y las respuestas
          _pages[4] = SummaryPage(onPageChange: _changePage, student: student, answer: answer);
          
        }else{
          // Actualiza la página de QuestionsBPage con el nuevo estudiante
          _pages[3] = QuestionsBPage(onPageChange: _changePage, student: student);
        }
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        leading:
          _currentPage != 0
          ? IconButton(onPressed: () { _changePage(_currentPage-1);}, icon: Icon(Icons.keyboard_return_outlined)
          ): null,

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(_titles[_currentPage]),
      ),

      body:  _pages[_currentPage],

      floatingActionButton: _currentPage == 0
        ? FloatingActionButton( //Condicional como en Java Script
        onPressed: () => _changePage(1),
        tooltip: "Nueva Encuesta",
        child: const Icon(Icons.add),
        ): null, // Oculta el botón en otras páginas
    );
  }
}

//