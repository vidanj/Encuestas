import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget{
  const DashboardPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Dashboard',style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      );
    
  }
}