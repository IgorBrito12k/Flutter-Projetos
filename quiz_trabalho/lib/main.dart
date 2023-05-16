import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trabalhoqa/pergunta_create.dart';
import 'package:trabalhoqa/pergunta_list.dart';

const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyA2Fc_ma6he0cRUU3w4Movpn_8nyKhtgaU",
  authDomain: "perguntas-qa.firebaseapp.com",
  projectId: "perguntas-qa",
  storageBucket: "perguntas-qa.appspot.com",
  messagingSenderId: "229629472269",
  appId: "1:229629472269:web:85b5b4c00a394285e52f44",
  measurementId: "G-LVFTKJ48VM"
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Q&A"),
        ),
        body: ListView(
          //revisar este widget << foi aqui qe muudeii Era ListView antes
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Card(child: PerguntaCreatePage()),
            ),
            Card(
              color: Colors.purple,
              margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Card(child: PerguntaListPage()),
            ),
          ],
        ));
  }
}
