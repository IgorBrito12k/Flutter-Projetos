import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trabalhoqa/pergunta_create.dart';
import 'package:trabalhoqa/pergunta_list.dart';

const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyAxpSn8Jahekr2SMkCbL3gVxhYu5plffAY",
    authDomain: "trabalho-qa.firebaseapp.com",
    projectId: "trabalho-qa",
    storageBucket: "trabalho-qa.appspot.com",
    messagingSenderId: "3972213465",
    appId: "1:3972213465:web:a719e3c459bc412ea86cc8",
    measurementId: "G-SHY9JT0JDK");

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
        body: Column(
          //revisar este widget << foi aqui qe muudeii Era ListView antes
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Card(child: PerguntaCreatePage()),
            ),
            PerguntaListPage(),
          ],
        ));
  }
}
