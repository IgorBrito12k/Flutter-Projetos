import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class UserRegisterPage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController txtEmail = TextEditingController();
   final TextEditingController txtSenha = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New User"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: txtEmail, 
              decoration: InputDecoration(
                hintText: "E-mail"
              ),
              keyboardType: TextInputType.emailAddress,
            ),

             TextField(
              controller: txtSenha, 
              decoration: InputDecoration(
                labelText: "Senha"
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () { 
                 auth.createUserWithEmailAndPassword(
                   email: txtEmail.text, password: txtSenha.text);
                   Navigator.pop(context);
                },  
                child: Text("Adicionar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}