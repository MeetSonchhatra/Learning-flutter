import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x =0;
  int y =0;
  // x & y simple int 
  num z =0;
  // z is num cause x/y could be decimal too and num takes both the value int and float

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();
  // 2 text editing controller je input aavyu ee ama store krva
  late final AppLifecycleListener _listener;

  @override
  void initState(){
     /*  AA void init  etle use thayu karn k aapde x and y ni value niche fxn ma pass krvani che 
     directly pass n kri ski etle initstate banvi kryu */ 
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    _listener =  AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStatechange,
      //onExitRequested: _onExitRequest,
      
    );
  }

void _onShow() => print("onShow Called");
void _onHide() => print("onHide Called");
void _onResume() => print("onResume Called");
void _onDetach() => print("onDetach Called");
void _onInactive() => print("onInactive Called");
void _onPause() => print("onPause Called");
void _onRestart() => print("onRestart Called");
void _onStatechange(AppLifecycleState state) => print("onStatechange Called with state: $state");
//void _onExitRequest() => print("onExitRequest Called");
@override
void dispose(){
  displayOneController.dispose();
  displayTwoController.dispose();
  _listener.dispose();
  super.dispose();
  // dispose is used for cleaning up resources
  // dispose is called automatically when widget is removed from tree
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child:  Column(
        children: [
          DisplayOne(hint:"Enter Second Number",controller:displayOneController),
          SizedBox(height: 30,),
          DisplayOne(hint:"Enter Second Number",controller:displayTwoController),
          
          SizedBox(height: 30,),
          Text(
            z.toString(),
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
            Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  //z = x+y;
                  setState(() {
                    z = num.tryParse(displayOneController.text)! + num.tryParse(displayTwoController.text)!;  
                  });
                  // directly z = x+y  ny thay ema 0  j answer aavse etle num.tryparse() thi karyu 
                  // num.trypase() is used for parsing string to number etle string ne num ma cnvrt krva
                  // we do tryparse()! cause if parsing fails it will return null which will throw error
                  // when ui is to be updated we use setState() 
                },
                child: Icon(CupertinoIcons.add),
                ),
                FloatingActionButton(
                onPressed: () {
                  //z = x-y;
                  setState(() {
                    z = num.tryParse(displayOneController.text)! - num.tryParse(displayTwoController.text)!;  
                  });
                },
                child: Icon(CupertinoIcons.minus),
                ),
                FloatingActionButton(
                onPressed: () {
                  //z = x*y;
                  setState(() {
                    z = num.tryParse(displayOneController.text)! * num.tryParse(displayTwoController.text)!;  
                  });
                },
                child: Icon(CupertinoIcons.multiply),
                ),
                FloatingActionButton(
                onPressed: () {
                  //z = x / y;
                  setState(() {
                    z = num.tryParse(displayOneController.text)! / num.tryParse(displayTwoController.text)!;  
                  });
                },
                child: Icon(CupertinoIcons.divide),
                ),

            ],
          ),
          SizedBox(height: 10,),
          FloatingActionButton.extended(
            onPressed: () 
            {
              setState(() {
                x =0;
                y =0;
                z =0;
                displayOneController.clear();
                displayTwoController.clear();
              });
            }, 
            label: Text("Clear")),
        ],
      ),
    );
  }
}

class DisplayOne extends StatelessWidget {
  const DisplayOne({
    super.key,
    this.hint = "Enter a number",
    required this.controller,
  });
  final String? hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.black,
        )
      ),
    );
  }
}