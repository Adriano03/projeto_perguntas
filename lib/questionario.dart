import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quantoResponder;
  final bool temPerguntasSelecionadas;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quantoResponder,
    required this.temPerguntasSelecionadas,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntasSelecionadas
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => quantoResponder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
