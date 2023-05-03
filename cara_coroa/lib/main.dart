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
  
  String mensagemUsuario = '';
  String mensagemMaquina = '';

  void _opcaoSelecionada(String escolhaUsuario) {
  var opcoes = ["Cara", "Coroa"];
  var numero = Random().nextInt(2);
  var escolhaMaquina = opcoes[numero];

  switch(escolhaMaquina) {
    case "Cara":
      setState(() => mensagemMaquina = 'A máquina escolheu Cara!');
      break;
    case "Coroa":
      setState(() => mensagemMaquina = 'A máquina escolheu Coroa!');
      break;
  }


  //Exibição da imagem escolhida pelo App
  if (escolhaUsuario == escolhaMaquina) {
      setState(() => mensagemUsuario = 'Você ganhou! ;)');
    } else {
      setState(() => mensagemUsuario = 'Você perdeu! :(');
    }
}
    

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cara ou coroa'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 35),
            Text('Selecione uma das opções abaixo:', style: estiloTitulo),
            SizedBox(height: 35),
            Text(mensagemMaquina, style: estiloTitulo),
            SizedBox(height: 15),
            Text(mensagemUsuario, style: estiloTitulo),
            SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _opcaoSelecionada('Coroa'),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.grey,
                        ),
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Center(
                          child: Text('Coroa', style: estilo),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
              child: GestureDetector(
                onTap: () => _opcaoSelecionada('Cara'),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Color.fromARGB(255, 221, 205, 58),
                    ),
                    height: 200,
                    width: 200,
                    margin: const EdgeInsets.all(10),
                    child: Center(
                      child: Text('Cara', style: estilo),
                    ),
                  ),
                )
              ),
            ),
            ], 
          ),
          ],
        )
      ),
    );
  } 
}