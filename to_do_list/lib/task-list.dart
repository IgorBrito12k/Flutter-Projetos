import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'task.dart';

class TaskListPage extends StatelessWidget {
FirebaseFirestore firestore = FirebaseFirestore.instance;

void update(String id, bool finished){
  firestore.collection('tasks').doc(id).update({
    'finished' : finished,
    'id':'xpto'
  });
}

void delete(String id){
  firestore.collection('tasks').doc(id).delete();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: firestore
        .collection('tasks')
        //.where('finished', isEqualTo: false)
        .orderBy('name', descending: false)
        .snapshots(),
        builder: (context, snapshot) {  
          if(!snapshot.hasData) return CircularProgressIndicator();

          var tasks = snapshot.data!.docs;

          return ListView(
            children: tasks
            .map((task) =>  Dismissible(
              key: Key(task.id),
              background: Container(color: Colors.red,),
              onDismissed: (_) => delete(task.id),
              child: CheckboxListTile(
                   onChanged: (value) => update(task.id, value!),
                    value: task['finished'],
                    title: Text(task['name']),
                    subtitle: Text('Low'),
                ),
            ))
              .toList(),
              );
        }
      ),
        
    
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/task-create'), //para navegar entre as telas o push é pra voltar o pop é para sobrepor
        child: Icon(Icons.add),
      ),
    );
  }
}