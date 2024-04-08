import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questao.dart';
import './resposta.dart';

void main() {
  runApp(PerguntasApp());
}

class _PerguntaAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {
          'texto': 'Preto',
          'nota': 10,
        },
        {
          'texto': 'Branco',
          'nota': 5,
        },
        {
          'texto': 'Vermelho',
          'nota': 3,
        },
        {
          'texto': 'Verde',
          'nota': 1,
        },
      ],
    },
    {
      'texto': 'Qual se animal favorito?',
      'respostas': [
        {
          'texto': 'Cachorro',
          'nota': 10,
        },
        {
          'texto': 'Gato',
          'nota': 5,
        },
        {
          'texto': 'Leão',
          'nota': 3,
        },
        {
          'texto': 'Coelho',
          'nota': 1,
        },
      ],
    },
    {
      'texto': 'Qual se instrutor favorito?',
      'respostas': [
        {
          'texto': 'Maria',
          'nota': 10,
        },
        {
          'texto': 'João',
          'nota': 5,
        },
        {
          'texto': 'Leo',
          'nota': 3,
        },
        {
          'texto': 'Pedro',
          'nota': 1,
        },
      ],
    },
  ];
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
          _perguntaSelecionada++;
          _pontuacaoTotal += pontuacao;
        },
      );
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
