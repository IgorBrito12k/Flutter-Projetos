import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(GameApp());
}

class GameApp extends StatefulWidget {
  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {

  final estilo = const TextStyle(
    color: Colors.white,
    fontSize: 32,);

    final estiloTitulo = const TextStyle(
    color: Colors.black,
    fontSize: 32,);
  
  String _mensagemUsuario = '';
  String _mensagemMaquina = '';

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaMaquina = opcoes[numero];

    //Exibição da imagem escolhida pelo App
    switch(escolhaMaquina) {
      case "pedra":
        setState(() => _mensagemMaquina = 'A máquina escolheu Pedra!');
        break;
      case "papel":
        setState(() => _mensagemMaquina = 'A máquina escolheu Papel!');
        break;
      case "tesoura":
        setState(() => _mensagemMaquina = 'A máquina escolheu Tesoura!');
    }
  

    //validação do ganhador
    if (
      (escolhaUsuario == "pedra" && escolhaMaquina == "tesoura") ||
      (escolhaUsuario == "tesoura" && escolhaMaquina == "papel") ||
      (escolhaUsuario == "papel" && escolhaMaquina == "pedra")
    ) {
      setState(() => _mensagemUsuario = 'Você ganhou!');
    } else if (
       (escolhaUsuario == "tesoura" && escolhaMaquina == "pedra") ||
      (escolhaUsuario == "papel" && escolhaMaquina == "tesoura") ||
      (escolhaUsuario == "pedra" && escolhaMaquina == "papel")
    ) {
      setState(() => _mensagemUsuario = 'Você perdeu!');
    } else {
      setState(() => _mensagemUsuario = 'Empatamos!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text(_mensagemMaquina, style: estiloTitulo),
            Text(_mensagemUsuario, style: estiloTitulo),
            Text('Selecione uma das opções abaixo', style: estiloTitulo),
            Expanded(
              child: GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Color.fromARGB(255, 46, 37, 39),
                    height: 200,
                    width: 250,
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Center(
                      child: Text('Pedra', style: estilo),
                    ),
                  ),
                )
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.grey,
                    height: 200,
                    width: 250,
                    margin: const EdgeInsets.all(10),
                    child: Center(
                      child: Text('Papel', style: estilo),
                    ),
                  ),
                )
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.red,
                    height: 200,
                    width: 250,
                    margin: const EdgeInsets.all(10),
                    child: Center(
                      child: Text('Tesoura', style: estilo),
                    ),
                  ),
                )
              ),
            ),
          ],
        )
      ),
    );
  } 
}
