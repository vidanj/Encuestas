import 'package:encuestas/models/answer.dart';
import 'package:encuestas/models/student.dart';
import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget{
  final Function(int) onPageChange;
  final Student? student;
  final Answer? answer;
  const SummaryPage ({super.key,required this.onPageChange, required this.student, required this.answer});

@override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Resumen',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          if (student != null) ...[
            Text('📋 **Datos del Estudiante:**', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Nombre: ${student!.name}',style: const TextStyle(fontSize: 20),),
            Text('Teléfono: ${student!.phone}',style: const TextStyle(fontSize: 20),),
            Text('Correo: ${student!.email}',style: const TextStyle(fontSize: 20),),
            Text('Matrícula: ${student!.matricula}',style: const TextStyle(fontSize: 20),),
            Text('Edad: ${student!.age}',style: const TextStyle(fontSize: 20),),
          ],
          const SizedBox(height: 20),
          if (answer != null) ...[
            Text('📊 **Respuestas de la Encuesta:**', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Horario Preferido: ${answer!.horario}',style: const TextStyle(fontSize: 20),),
            Text('Carrera: ${answer!.carrera}',style: const TextStyle(fontSize: 20),),
            Text('Especialidad: ${answer!.especialidad}',style: const TextStyle(fontSize: 20),),
            Text('Promedio: ${answer!.promedio}',style: const TextStyle(fontSize: 20),),
            Text('Sector Residencial: ${answer!.sector}',style: const TextStyle(fontSize: 20),),
          ],
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () => onPageChange(0),
              child: const Text("Volver al Inicio"),
            ),
          ),
        ],
      ),
    );
  }
}
