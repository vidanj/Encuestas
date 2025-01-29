import 'package:flutter/material.dart';

  // Top-level function to create a centered TextFormField with padding
   Widget buildTextFormField({required String hintText, required String validateText}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 104, 104, 104),
            fontSize: 16,
          ),
          border: OutlineInputBorder(), 
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validateText;
          }
          return null;
        },
      ),
    );
  }
