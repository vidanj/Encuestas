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

  final List<Widget> _pages = [
    const DashboardPage(), // 0 
    const SurveyPage(), // 1
    const QuestionsAPage(), // 2
    const QuestionsBPage(), // 3
    const SummaryPage(), // 4

  ];

   final List<String> _titles = [
    'Dashboard',
    'Nueva Encuesta',
    'Preguntas A',
    'Preguntas B',
    'Resumen',
  ];

  int _currentPage = 0;

  void _changePage (int pageIndex){
    setState(() {
       _currentPage = pageIndex;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(_titles[_currentPage]),
      ),
      body:  _pages[_currentPage],

      floatingActionButton: FloatingActionButton(
        onPressed: () => _changePage(1),
        tooltip: "Nueva Encuesta",
        child: const Icon(Icons.add),
        ),
    );
  }
}
