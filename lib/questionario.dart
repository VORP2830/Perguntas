import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quantoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quantoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: <Widget>[
        Questao(
          perguntas[perguntaSelecionada]['texto'].toString(),
        ),
        ...respostas.map(
          (resp) => Resposta(
            resp['texto'].toString(),
            () => quantoResponder(
              int.parse(
                resp['nota'].toString(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
