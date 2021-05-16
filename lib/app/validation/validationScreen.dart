import 'package:flutter/material.dart';

class ValidationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
          body: Center(child: Text("Conta validada com sucesso!", style: TextStyle(color: Colors.white, fontSize: 20),)),
      );
  }
}