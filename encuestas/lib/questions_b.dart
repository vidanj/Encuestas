import 'package:flutter/material.dart';
import 'models/student.dart';

class QuestionsBPage extends StatefulWidget{
  final Function(int) onPageChange;
  final Student student;
  const QuestionsBPage ({super.key, required this.onPageChange, required this.student});

  @override
  State<QuestionsBPage> createState() => _QuestionsBPageState();
  }

class _QuestionsBPageState extends State<QuestionsBPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Nombre: " + widget.student.name, // Use widget.student.name here
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              "Telefono: " + widget.student.phone, 
              style: const TextStyle(fontSize: 40),
            ),
            Text(
               "Correo: " +widget.student.email, 
              style: const TextStyle(fontSize: 40),
            ),
            Text(
               "Matricula: " +widget.student.matricula, 
              style: const TextStyle(fontSize: 40),
            ),
            Text(
               "Edad: " +widget.student.age, 
              style: const TextStyle(fontSize: 40),
            ),

            ElevatedButton(onPressed: () => widget.onPageChange(4), child: Text("Terminar")),
          ],
        ),
      );
    
  }
}