import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp>{

  var _perguntaSelecionada = 0;

  final _perguntas = const [
      {
        'texto': "Qual é sua cor preferida ?",
        'respostas': ['Preto','Vermelho','Verde','Branco'],
      },
      {
        'texto': "Qual é seu animal preferido?",
        'respostas': ['Coelho','Cobra','Elefante','Leão'],
      },
      {
        'texto': "Qual é seu instrutor preferido ?",
        'respostas': ['Maria','Jõao','Leo','Pedro'],
      },
    ];
  
  void _responder(){
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context){
    
    List<String> respostas = temPerguntaSelecionada 
    ? _perguntas[_perguntaSelecionada].cast()['respostas']
    : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas')
        ),
        body: temPerguntaSelecionada ? Column(
          children: <Widget>[
            Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ) : null,
      )
    );
  }
}

class PerguntaApp extends StatefulWidget {  
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
  
}
