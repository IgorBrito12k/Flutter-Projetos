import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PerguntaCreatePage extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //final TextEditingController txtName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
          child: Container(
            //revisar este widget, Textfiield nao estava wraped con container antes
            child: TextField(
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
                onPressed: () => {},
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
