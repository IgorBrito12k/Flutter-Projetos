import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskCreatePage extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtPriority = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: txtName, 
              decoration: InputDecoration(
                hintText: "Digite o que precisa fazer..."
                //labelText: "nome",
              ),
              //obscureText: true, como se fosse o password no html
              //keyboardType: TextInputType.visiblePassword, NÃO PEGA NA WEB
              keyboardType: TextInputType.text,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () { 
                  firestore.collection("tasks").add({
                    'name': txtName.text,
                    'finished': false,
                    'priority': txtPriority.text,
                    'uid': auth.currentUser!.uid
                  });
                  Navigator.of(context).pop(); },
                child: Text("Adicionar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}