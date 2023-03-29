import 'package:flutter/material.dart';
import 'dart:math';

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
    fontSize: 32,
  );
  final estiloTitulo = const TextStyle(
    color: Colors.black,
    fontSize: 32,);

  Color cor1 = Colors.blue;
  Color cor2 = Colors.blue;
  Color cor3 = Colors.blue;
  Color cor4 = Colors.blue;

  String resposta = '';
  String status = '';
  
  void play(String option) {
  
    if (option == 'Sao Paulo'){
      setState(() {
        status = 'Resposta errada';
        cor1 = Colors.red;
      });
    }else if ((option == 'Rio de Janeiro')){
      setState(() {
        status = 'Resposta errada';
        cor2 = Colors.red;
      });
    }else if ((option == 'Brasilia')){
      setState(() {
        status = 'Resposta certa';
        cor3 = Colors.green;
      });
    }else if ((option == 'Salvador')){
      setState(() {
        status = 'Resposta errada';
        cor4 = Colors.red;
      });
    } 
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GestureDetector(
                //onTap: () => play('par'),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purple),
                    height: 400,
                    width: 750,
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Center(
                      child: Text('Qual é a atual Capital do Brasil?', style: estilo),
                    ), 
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(status, style: estiloTitulo,),
            SizedBox(height: 30),
            Expanded(
              child: GestureDetector(
                onTap: () => play('Sao Paulo'),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: cor1),
                    height: 400,
                    width: 550,
                    margin: const EdgeInsets.all(10),
                    child: Center(
                      child: Text('São Paulo', style: estilo),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => play('Rio de Janeiro'),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: cor2),
                    height: 400,
                    width: 550,
                    margin: const EdgeInsets.all(10),
                    child: Center(
                      child: Text('Rio de Janeiro', style: estilo),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => play('Brasilia'),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: cor3),
                    height: 400,
                    width: 550,
                    margin: const EdgeInsets.all(10),
                    child: Center(
                      child: Text('Brasilia', style: estilo),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => play('Salvador'),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: cor4),
                    height: 400,
                    width: 550,
                    margin: const EdgeInsets.all(10),
                    child: Center(
                      child: Text('Salvador', style: estilo),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}