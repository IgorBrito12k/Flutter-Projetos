import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String saidaTela = "0";
  String saidaPessoal = "0";
  double numero1 = 0;
  double numero2 = 0;
  String operador = "";


  buttonPressed(String buttonText) {

    if(buttonText == "Limpar") {
      saidaPessoal = "0";
      numero1 = 0;
      numero2 = 0;
      operador = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "x"){
        //converte a string em double
        numero1 = double.parse(saidaTela);
        operador = buttonText; 
        saidaPessoal = "0";
        //varificar se ja é decimal
    } else if (buttonText == ".") {
        if(saidaPessoal.contains(".")) {
          print("já contém um decimal");
        } else {
          saidaPessoal = saidaPessoal + buttonText;
        }

    } else if (buttonText == "=") {
      numero2 = double.parse(saidaTela);
        if(operador == "+") {
          saidaPessoal = (numero1 + numero2).toString();
        }
        if(operador == "-") {
          saidaPessoal = (numero1 - numero2).toString();
        }
        if(operador == "x") {
          saidaPessoal = (numero1 * numero2).toString();
        }
        if(operador == "/") {
          saidaPessoal = (numero1 / numero2).toString();
        }
      numero1 = 0;
      numero2 = 0;
      operador = "";
    } else {
      saidaPessoal = saidaPessoal + buttonText;
    }
    print(saidaPessoal);
    setState(() {
      saidaTela = double.parse(saidaPessoal).toStringAsFixed(1);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: SizedBox(
        height: 70.0,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: OutlinedButton(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => buttonPressed(buttonText),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title)
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                saidaTela,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            new Column(
              children: [
                new Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/"),
                  ],
                ),
                new Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ],
                ),
                new Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("x"),
                  ],
                ),
                new Row(
                  children: [
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                  ],
                ), 
                new Row(
                  children: [buildButton("Limpar"), buildButton("=")],
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}