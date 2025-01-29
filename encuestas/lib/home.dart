import 'package:encuestas/dashboard.dart';
import 'package:encuestas/questions_a.dart';
import 'package:encuestas/questions_b.dart';
import 'package:encuestas/summary.dart';
import 'package:encuestas/survey.dart';
import 'package:flutter/material.dart';

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
    'Preguntas A',
    'Preguntas B',
    'Resumen',
  ];

  int _currentPage = 0;


  @override
  void initState() {
    super.initState();
    // Initialize `_pages` here when the instance is fully created
    _pages = [
      DashboardPage(), // 0
      SurveyPage(onPageChange: _changePage), // 1
      QuestionsAPage(onPageChange: _changePage), // 2
      QuestionsBPage(onPageChange: _changePage), // 3
      SummaryPage(onPageChange: _changePage), // 4
    ];
  }


  void _changePage (int pageIndex){
    setState(() {
       _currentPage = pageIndex;
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
