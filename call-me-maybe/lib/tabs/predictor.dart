import 'package:flutter/material.dart';
import 'dart:math';

class Predictor extends StatefulWidget {
  const Predictor({Key? key}) : super(key: key);

  @override
  _PredictorState createState() => _PredictorState();
}

// array of 8 different answers
class _PredictorState extends State<Predictor> {
  int counter = 0;
  // random from dart math
  Random random = Random();
  final List<String> outputs = [
    'Unlikely but possible.',
    'Maybe indeed.',
    'Yes, Definietly.',
    'The future is uncertain.',
    'I dont know..dont ask me.',
    'Let\'s see, Of course!!!',
    'In your dreams...',
    'Ask me later..'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[100],
        body: Center(
            child: Column(
          children: [
            //title
            Padding(
                padding: EdgeInsets.fromLTRB(10, 80, 10, 20),
                child: Text('Call Me...Maybe?',
                    style: Theme.of(context).textTheme.display2)),
            //the text with on tap function
            Padding(
                padding: EdgeInsets.all(20),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //uses random function to set counter to
                        counter = random.nextInt(8);
                      });
                    },
                    child: Text("Ask a question...Tap for the answer",
                        style: TextStyle(color: Colors.purpleAccent)))),
            //the stateful text
            Padding(
                padding: EdgeInsets.all(20),
                child: Text(outputs[counter],
                    style: TextStyle(fontSize: 23, color: Colors.lightBlue)))
          ],
        )));
  }
}
