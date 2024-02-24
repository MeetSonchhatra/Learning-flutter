import 'package:flutter/material.dart';
import 'package:learning_app1/view/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter run",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomeView(),
    );
  }
}
