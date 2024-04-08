import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  String texto;
  final void Function() quantoSelecionado;

  Resposta(this.texto, this.quantoSelecionado);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: quantoSelecionado,
        child: Text(texto),
      ),
    );
  }
}
