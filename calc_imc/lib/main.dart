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
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
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

  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();

  String resultadoIMC = '';
  String tipoDoIMC = '';
  var imagemAtualizada = "";

  void calcularIMC() {
  
  var imagem = 'images/abaixo.jpg';
    //Coloquei tudo em número para realizar o calculo
    double calculo = (double.parse(controllerPeso.text) / (double.parse(controllerAltura.text) * (double.parse(controllerAltura.text))));

    //calculando o tipo de IMC
    String tipo = '';

    if (calculo < 18.5){
      tipo = "Magreza";
      imagem = 'images/abaixo.jpg';
    } else if (calculo > 18.5 && calculo <= 24.9){
      tipo = "Saudavel";
      imagem = 'images/ideal.jpg';
    } else if (calculo > 25.0 && calculo <= 30){
      tipo = "Sobrepeso";
      imagem = 'images/excesso.jpg';
    } else if (calculo > 30.0 && calculo <= 35){
      tipo = "Obesidade Grau 1 ";
      imagem = 'images/obesidade1.jpg';
    } else if (calculo > 35.0 && calculo <= 40){
      tipo = "Obesidade Grau 2 (Severa)";
      imagem = 'images/obesidade2.jpg';
    }  else {
      tipo = "Obesidade Grau 3 (Morbida)";
    }
    
    setState(() {
      //coloco o número resultante de calculo em string para exibir
      resultadoIMC = calculo.toStringAsFixed(2);
      tipoDoIMC = tipo;
      imagemAtualizada = imagem;
    });
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Calculadora de IMC',
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controllerPeso,
                decoration: InputDecoration(
                  labelText: "Peso ",
                  hintText: "Digite seu peso",
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0))
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controllerAltura,
                decoration: InputDecoration(
                  labelText: "Altura ",
                  hintText: "Digite sua altura",
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),

              const SizedBox(height: 32,),
              Text(resultadoIMC, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(tipoDoIMC, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16,),
              Image.asset(
                imagemAtualizada,
                height: 150,
              ),
              //vamos criar o botão
              SizedBox(height: 20,),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: calcularIMC,
                   child: const Text('Calcular'),
                   ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          setState(() {
            resultadoIMC = '';
            tipoDoIMC = '';
            imagemAtualizada = '';
          });
        },
        child: Text('Limpar resultado'),
      ),
    );
  }
}