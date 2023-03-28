import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'jogo Genius',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'jogo Genius'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  final estilo = const TextStyle(
    color: Colors.white,
    fontSize: 32,);

  List<Color> cores = [Colors.green, Colors.red, Colors.blue, Colors.yellow];
  List<Color> sequencia = [];
  List<Color> escolhaUsuario = [];
  bool gameOver = false;
  
  //fazer o controle de transição mais lento
  late AnimationController controlador;
  double opacidade = 0.2; //opacidade fraca

  @override
  //iniciar o estado da widget para gerar a sequencia junto
  void  initState(){
    super.initState();
    //iniciar o controle de animação
    controlador = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
      );
    gerarSequencia();
  }

  void gerarSequencia() async{
    sequencia.clear();
    Random random = Random();
    for (int i = 0; i < 3; i++) {
      sequencia.add(cores[random.nextInt(3)]);
    }

    //atualiza a opacidade da cor gradualmente
    for (double opacity = 0.2; opacity < 1.0; opacity += 0.1) {
      setState(() {
        opacidade = opacity;
      });
      // espera 50ms antes de atualizar a opacidade novamente
      await Future.delayed(Duration(milliseconds: 50));
    }
    // espera 500ms antes de ir para a próxima cor
     await Future.delayed(Duration(milliseconds: 700));
  }

  void checarEscolhaUsuario() {
    //se sequencia for diferente da escolha do user, game over
    if (sequencia.length != escolhaUsuario.length) {
      gameOver = true;
      return;
    }

    for (int i = 0; i < sequencia.length; i++) {
      if (sequencia[i] != escolhaUsuario) {
        gameOver = true;
        return;
      }
    }
    escolhaUsuario.clear();
    gerarSequencia();
  }

  void clicado(Color color) {
    if (gameOver) {
      return;
    }
    setState(() {
      escolhaUsuario.add(color);
      checarEscolhaUsuario();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(
              child: GestureDetector(
                onTap: () => gerarSequencia(),
                child: Container(
                height: 40,
                width: double.infinity,
                color: Colors.grey,
                child: Text('Jogar', style: estilo),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => clicado(cores[0]),
                      child: AnimatedContainer(
                        // a duração da animação é de 500ms
                        duration: Duration(milliseconds: 500),
                        // usa a opacidade para alterar a intensidade da cor
                        color: cores[0].withOpacity(opacidade),
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => clicado(cores[1]),
                      child: AnimatedContainer(  
                        duration: Duration(milliseconds: 500),
                        color: cores[1].withOpacity(opacidade),
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => clicado(cores[2]),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        color: cores[2].withOpacity(opacidade),
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => clicado(cores[3]),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        color: cores[3].withOpacity(opacidade),
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              )
            ),
        ],
      ),
    );
  }
}
            