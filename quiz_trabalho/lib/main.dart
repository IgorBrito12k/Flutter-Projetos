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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Q&A"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Faça sua pergunta', 
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: ElevatedButton(
                onPressed: () => {},
                child: Text('Enviar'),
              ),
            ),
            Flexible(
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.blue,
                margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: ListTile(
                  title: Text("Pergunta 1"),
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.blue,
                margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: ListTile(
                  title: Text("Pergunta 2"),
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.blue,
                margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: ListTile(
                  title: Text("Pergunta 3"),
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.blue,
                margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: ListTile(
                  title: Text("Pergunta 4"),
                ),
              ),
            )
          ],
        ));
  }
}
