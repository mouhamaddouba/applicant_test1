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
            //TODO(task1): print the post coming from the api (using print method)
            //TODO(task2): store the the post coming from api in local
            //TODO(task2): get the post from local db and print the post title(using print method)
            //TODO(task3) design Column with tow text and print the result of task1 in the first Text widget and print the result of task2 in the second Text widget
            child: Text("Hello!!"),
          ),
        ),
      ),
    );
  }
}
