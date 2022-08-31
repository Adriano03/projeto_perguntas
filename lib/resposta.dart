import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue
        ),
        onPressed: quandoSelecionado,
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white),
          ),
      ),
    );
  }
}