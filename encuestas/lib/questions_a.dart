import 'package:flutter/material.dart';
import 'utilidades.dart'; import 'models/student.dart';

class QuestionsAPage extends StatefulWidget{
  final Function(int) onPageChange;
  final Student student;
  const QuestionsAPage ({super.key, required this.onPageChange, required this.student});

  @override
  State<QuestionsAPage> createState() => _QuestionsAPageState();
  }

class _QuestionsAPageState extends State<QuestionsAPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _ageController = TextEditingController();


  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _matriculaController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( child: 
      Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildTextFormField(hintText: '¿Cual es tu nombre?', validateText: 'Por favor, ingrese su nombre.', controller: _nameController),
            buildTextFormField(hintText: '¿Cual es tu telefono?', validateText: 'Por favor, ingrese su nombre.', controller: _phoneController),
            buildTextFormField(hintText: '¿Cual es tu correo?',validateText: 'Por favor, ingrese su correo.',controller: _emailController),
            buildTextFormField(hintText: '¿Cual es tu matricula?',validateText: 'Por favor, ingrese su matricula.',controller: _matriculaController),
            buildTextFormField(hintText: '¿Cual es tu edad?',validateText: 'Por favor, ingrese su edad.',controller: _ageController),

            ElevatedButton(
              onPressed: () {
                // Validate the form before proceeding
                if (_formKey.currentState!.validate()) {

                  widget.student.name = _nameController.text;
                  widget.student.phone = _phoneController.text;
                  widget.student.email = _emailController.text;
                  widget.student.matricula = _matriculaController.text;
                  widget.student.age = _ageController.text;
                  //print("AQUI!!!!!!!!!!!!!");
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