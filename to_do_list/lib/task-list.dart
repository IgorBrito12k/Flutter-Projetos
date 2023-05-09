import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'task.dart';

class TaskListPage extends StatelessWidget {
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

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
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut();
              Navigator.of(context).pushReplacementNamed('/user-login');
            },
            icon: const Icon(Icons.logout),)
        ],
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
              background: Container(color: Colors.red,
              child: Text("Delete"),),
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
        
        // OU
        //   return ListView(
        //     children: tasks
        //     .map((task) =>  Dismissible(
        //       key: Key(task.id),
        //       background: Container(color: Colors.red,),
        //       onDismissed: (_) => delete(task.id),
        //       child: ListTile(
        //           leading: Checkbox(
        //             onChanged: (value) => update(task.id, value!),
        //             value: task['finished'],
        //             ),
        //             title: Text(task['name']),
        //             subtitle: Text('Low'),
        //             trailing: IconButton(
        //               icon: Icon(Icons.delete),
        //               onPressed: () => delete(task.id)
        //               ),
        //         ),
        //     ))
        //       .toList(),
        //       );
        // }

      floatingActionButton: FloatingActionButton(
        //para navegar entre as telas o push é pra voltar o pop é para sobrepor
        onPressed: () => Navigator.of(context).pushNamed('/task-create'), 
        child: Icon(Icons.add),
      ),
    );
  }
}