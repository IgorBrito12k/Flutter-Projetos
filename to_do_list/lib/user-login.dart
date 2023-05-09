import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserLoginPage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtSenha = TextEditingController();

  void login(BuildContext context) async {
      try {
        await auth.signInWithEmailAndPassword(
          email: txtEmail.text, password: txtSenha.text);
        Navigator.of(context).pushReplacementNamed('/task-list');
      } on Exception catch (error) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text("Erro no login irmão"),
            );
          }
        );
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(labelText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtSenha,
              decoration: InputDecoration(labelText: "Senha"),
              obscureText: true,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  login(context);
                },
                child: Text("Entrar"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => 
                  Navigator.of(context).pushNamed('/user-register'), //para navegar entre as telas o push é pra voltar o pop é para sobrepor
                child: Text("Não possui conta? Clique aqui"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
