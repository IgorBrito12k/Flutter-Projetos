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
        primarySwatch: Colors.purple,
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Faça sua pergunta',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Enviar como anônimo"),
                          ElevatedButton(
                            onPressed: () => {},
                            child: Text('Enviar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.purple,
              margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
              child: ListTile(
                leading: CircleAvatar(),
                title: Text("Palmirinha"),
                subtitle:
                    Text("Qual sua opinião sobre o Vale a pena ver de novo?"),
                trailing: Container(
                  width: 60,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_up_alt_sharp),
                        tooltip: 'Deixe seu like',
                        onPressed: () => {},
                      ),
                      Text("52")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
