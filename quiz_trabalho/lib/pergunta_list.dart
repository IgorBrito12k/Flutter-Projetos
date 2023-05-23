import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PerguntaListPage extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void deixarLike(String id, int likes) {
    firestore.collection('Perguntas').doc(id).update({'likes': likes + 1});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: firestore
          .collection('Perguntas')
          .orderBy('likes', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text(snapshot.error.toString());
        if (!snapshot.hasData) return CircularProgressIndicator();

        var perguntas = snapshot.data!.docs;
        //print(snapshot.data!.docs);

        return Expanded(
          child: ListView(
            children: perguntas.map((pergunta) {
              return Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.purple,
                  margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: ListTile(
                    leading: CircleAvatar(),
                    title: Text(pergunta['nome']),
                    textColor: Colors.white,
                    subtitle: Text(pergunta['pergunta']),
                    trailing: Container(
                      width: 60,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.thumb_up_alt_sharp),
                            tooltip: 'Deixe seu like',
                            onPressed: () {
                              if (pergunta['nome'] == 'Anonimo') {
                                Key(pergunta.id);
                                deixarLike(pergunta.id, pergunta['likes']);
                              }
                            },
                          ),
                          Text(pergunta['likes'].toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
