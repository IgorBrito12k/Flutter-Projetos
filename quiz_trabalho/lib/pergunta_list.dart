import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PerguntaListPage extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    stream: firestore
        .collection('perguntas')
        .snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) return CircularProgressIndicator();

      var perguntas = snapshot.data!.docs;
      //print(snapshot.data!.docs);

      return ListView(
        children: perguntas
        .map((pergunta) => ListTile(
            leading: CircleAvatar(),
            title: Text(pergunta['nome']),
            subtitle: Text(pergunta['pergunta']),
            trailing: Container(
              width: 60,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.thumb_up_alt_sharp),
                    tooltip: 'Deixe seu like',
                    onPressed: () {},
                  ),
                  Text(pergunta['likes'].toString()),
                ],
              ),
            ),
          ),
        ).toList(),
      );
    },
  );
}
}