import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: SafeArea(
          child: Center(
            //TODO(task1): print the post coming from the api
            //TODO(task2): store the the post coming from api in local
            //TODO(task2): get the post from local db and print the post title
            child: Text("Hello!!"),
          ),
        ),
      ),
    );
  }
}
