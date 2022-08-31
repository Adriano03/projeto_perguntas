import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': "Qual a capital do Paraná ?",
      'respostas': [
        {'texto': 'Brasília', 'pontuacao': 0},
        {'texto': 'Boa Vista', 'pontuacao': 0},
        {'texto': 'Curitiba', 'pontuacao': 2},
        {'texto': 'Porto Alegre', 'pontuacao': 0},
      ],
    },
    {
      'texto': "Qual a capital do Acre ?",
      'respostas': [
        {'texto': 'Maceió', 'pontuacao': 0},
        {'texto': 'Rio Branco', 'pontuacao': 2},
        {'texto': 'João Pessoa', 'pontuacao': 0},
        {'texto': 'Natal', 'pontuacao': 0},
      ],
    },
    {
      'texto': "Qual a capital de Rondònia ?",
      'respostas': [
        {'texto': 'São Paulo', 'pontuacao': 0},
        {'texto': 'Belo Horizonte', 'pontuacao': 0},
        {'texto': 'Aracaju', 'pontuacao': 0},
        {'texto': 'Porto Velho', 'pontuacao': 2},
      ],
    },
    {
      'texto': "Qual a capital de Santa Catarina ?",
      'respostas': [
        {'texto': 'Florianópolis', 'pontuacao': 2},
        {'texto': 'Teresina', 'pontuacao': 0},
        {'texto': 'Palmas', 'pontuacao': 0},
        {'texto': 'Vitória', 'pontuacao': 0},
      ],
    },
    {
      'texto': "Qual a capital de Goiás ?",
      'respostas': [
        {'texto': 'São Luís', 'pontuacao': 0},
        {'texto': 'Manaus', 'pontuacao': 0},
        {'texto': 'Goiânia', 'pontuacao': 2},
        {'texto': 'Macapá', 'pontuacao': 0},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas Capitais'),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantoResponder: _responder,
                temPerguntasSelecionadas: temPerguntaSelecionada,
              )
            : Resultado(
                _pontuacaoTotal,
                _reiniciarQuestionario,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
