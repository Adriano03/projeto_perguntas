import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(
    this.pontuacao,
    this.quandoReiniciarQuestionario,
  );

  String get fraseResultado {
    if (pontuacao == 0) {
      return 'Você precisa estudar mais!';
    } else if (pontuacao == 2) {
      return 'Continue estudando!';
    } else if (pontuacao == 4) {
      return 'Está ficando bom!';
    } else if (pontuacao == 6) {
      return 'Você está acima da media';
    } else if (pontuacao == 8) {
      return "Mandou muito bem!";
    } else {
      return 'Parabéns acertou tudo!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
