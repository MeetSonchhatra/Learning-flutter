import 'package:flutter/material.dart';
import 'package:learning_app1/view/calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        
        child: Container(
          color: Colors.deepOrange,
          // child: const Center(
          //   child: Text(
          //     "Hello World",
          //     style: TextStyle(
          //       fontSize: 40,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          child: CalculatorView(),
        ),

      ),
    );
  }
}