import 'package:flutter/material.dart';
import 'utilidades.dart';

class QuestionsAPage extends StatefulWidget{
  final Function(int) onPageChange;
  const QuestionsAPage ({super.key, required this.onPageChange});

  @override
  State<QuestionsAPage> createState() => _QuestionsAPageState();
  }

class _QuestionsAPageState extends State<QuestionsAPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( child: 
      Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildTextFormField(hintText: '¿Cual es tu telefono?', validateText: 'Por favor, ingrese su nombre.'),
            buildTextFormField(hintText: '¿Cual es tu correo?',validateText: 'Por favor, ingrese su correo.'),
            buildTextFormField(hintText: '¿Cual es tu matricula?',validateText: 'Por favor, ingrese su matricula.'),
            buildTextFormField(hintText: '¿Cual es tu edad?',validateText: 'Por favor, ingrese su edad.'),

            ElevatedButton(
              onPressed: () {
                // Validate the form before proceeding
                if (_formKey.currentState!.validate()) {
                  widget.onPageChange(3); 
                }
              },
              child: const Text("Continuar"),
            ),
          ],
        ),
      ),
    ),
    );
  }
}