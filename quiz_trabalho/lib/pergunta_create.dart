import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PerguntaCreatePage extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController txtPergunta = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
          child: Container(
            //revisar este widget, Textfiield nao estava wraped con container antes
            child: TextField(
              controller: txtPergunta,
              maxLines: 5,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Faça sua pergunta',
              ),
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
                onPressed: () => {
                  firestore.collection('Perguntas').add({
                    'pergunta': txtPergunta.text,
                    'uid': auth.currentUser!.uid,
                    'userName': auth.currentUser!.displayName == null
                        ? 'Anonimo'
                        : auth.currentUser!.displayName,
                    'likes': [],
                    'data': DateTime.now(),
                  })
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
