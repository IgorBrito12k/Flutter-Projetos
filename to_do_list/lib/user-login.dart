import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserLoginPage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: txtSenha,
              decoration: InputDecoration(hintText: "Senha"),
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  auth.signInWithEmailAndPassword(
                      email: txtEmail.text, password: txtSenha.text);
                },
                child: Text("Logar"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed(
                    '/user-register'), //para navegar entre as telas o push é pra voltar o pop é para sobrepor
                child: Text("Não possui conta? Clique aqui"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
