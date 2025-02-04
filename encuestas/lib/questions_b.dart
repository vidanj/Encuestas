import 'package:flutter/material.dart';
import 'models/student.dart';

class QuestionsBPage extends StatefulWidget{
  final Function(int) onPageChange;
  final Student? student;
  const QuestionsBPage ({super.key, required this.onPageChange, required this.student});

  @override
  State<QuestionsBPage> createState() => _QuestionsBPageState();
  }

class _QuestionsBPageState extends State<QuestionsBPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Nombre: ${widget.student?.name}", 
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Telefono: ${widget.student?.phone}", 
              style: const TextStyle(fontSize: 20),
            ),
            Text(
               "Correo: ${widget.student?.email}", 
              style: const TextStyle(fontSize: 20),
            ),
            Text(
               "Matricula: ${widget.student?.matricula}", 
              style: const TextStyle(fontSize: 20),
            ),
            Text(
               "Edad: ${widget.student?.age}", 
              style: const TextStyle(fontSize: 20),
            ),

            ElevatedButton(onPressed: () => widget.onPageChange(4), child: Text("Terminar")),
          ],
        ),
      );
    
  }
}