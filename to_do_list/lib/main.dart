import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_list/task-list.dart';
import 'package:task_list/task-create.dart';
import 'package:task_list/user-register.dart';
import 'package:task_list/user-login.dart';

const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyAZjMvGnQim2mxFu44piGd_7c5M8N3Md8E",
  authDomain: "task-list-ib12k.firebaseapp.com",
  projectId: "task-list-ib12k",
  storageBucket: "task-list-ib12k.appspot.com",
  messagingSenderId: "180918853653",
  appId: "1:180918853653:web:7bd1af9b8a5d105a6bee1c"
    );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: TaskListPage(), pode ser esse pra iniciar a rota ou o initialRoute o que vc preferir
      initialRoute: '/user-login',
      routes: {
        '/task-create': (context) => TaskCreatePage(),
        '/task-list': (context) => TaskListPage(),
        '/user-register': (context) => UserRegisterPage(),
        '/user-login': (context) => UserLoginPage()
      },
    );
  }
}
