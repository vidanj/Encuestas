import 'package:encuestas/models/answer.dart';
import 'package:flutter/material.dart';
import 'models/student.dart';
import 'utilidades.dart';

class QuestionsBPage extends StatefulWidget{
  final Function(int,Student?,Answer) onPageChange;
  final Student? student;
  const QuestionsBPage ({super.key, required this.onPageChange, required this.student});

  @override
  State<QuestionsBPage> createState() => _QuestionsBPageState();
  }

class _QuestionsBPageState extends State<QuestionsBPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _horarioController = TextEditingController();
  final _carreraController = TextEditingController();
  final _especialidadController = TextEditingController();
  final _promedioController = TextEditingController();
  final _sectorController = TextEditingController();


  @override
  void dispose() {
    _horarioController.dispose();
    _carreraController.dispose();
    _especialidadController.dispose();
    _promedioController.dispose();
    _sectorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16),
        child: 
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (widget.student != null) ...[
                  Text('📋 **Datos del Estudiante:**', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                ],

                buildTextFormField(hintText: 'Horario Preferencial (Matutino/Vespertino):', 
                validateText: 'Por favor, ingrese un horario (Matutino/Vespertino).', controller: _horarioController),
                buildTextFormField(hintText: 'Carrera a Elegir:', validateText: 'Por favor, ingrese una carrera.', controller: _carreraController),
                buildTextFormField(hintText: '¿Cual es la especialidad deseada?',validateText: 'Por favor, ingrese una especialidad.',controller: _especialidadController),
                buildTextFormField(hintText: '¿Cual es su promedio?',validateText: 'Por favor, ingrese su promedio.',controller: _promedioController),
                buildTextFormField(hintText: '¿Cual es su Sector Residencial (norte, sur, poniente, etc)?',
                validateText: 'Por favor, ingrese su sector (norte, sur, poniente, etc).',controller: _sectorController),

                Center(
                  child:
                  ElevatedButton(
                  onPressed: () {
                    // Validate the form before proceeding
                    if (_formKey.currentState!.validate()) {

                      Answer answer = Answer(
                        _horarioController.text, 
                        _carreraController.text, 
                        _especialidadController.text, 
                        _promedioController.text, 
                        _sectorController.text);
                      //print("AQUI!!!!!!!!!!!!!");
                      widget.onPageChange(4,widget.student,answer); 
                    }
                  },
                  child: const Text("Continuar"),
                ), 
              ),
                
              ],
          ),
        ),
      ),
    );
  }
}