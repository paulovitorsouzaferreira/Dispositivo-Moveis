import 'package:flutter/material.dart';
import 'package:flutter_application_1/pergunta.dart';
import 'package:flutter_application_1/questoes.dart';

import 'botao_resposta.dart';

class Janela2 extends StatefulWidget {
  const Janela2({
    super.key,
  });

  @override
  State<Janela2> createState() => _Janela2State();
}

class _Janela2State extends State<Janela2> {
  int indiceQuestao = 0;

  late List<String> respostasEmbaralhadas;

  @override
  void initState() {
    super.initState();

    respostasEmbaralhadas = questoes[indiceQuestao].Embaralha();
  }

  void proximaQuestao() {
    setState(() {
      indiceQuestao++;

      if (indiceQuestao >= questoes.length) {
        indiceQuestao = 0;
      }

      respostasEmbaralhadas = questoes[indiceQuestao].Embaralha();
    });
  }

  @override
  Widget build(BuildContext context) {
    Pergunta questaoAtual = questoes[indiceQuestao];

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                'assets/imagens/palhaco_ouve.png',
              ),
            ),
          ),
          Text(questaoAtual.texto),
          const SizedBox(
            height: 10,
          ),
          ...respostasEmbaralhadas.map((item) {
            return BotaoReposta(
              cor: const Color.fromARGB(255, 224, 55, 47),
              callResposta: () {
                print('Resposta selecionada!');
                print('Item: $item');

                proximaQuestao();
              },
              textoResposta: item,
            );
          }),
        ],
      ),
    );
  }
}
