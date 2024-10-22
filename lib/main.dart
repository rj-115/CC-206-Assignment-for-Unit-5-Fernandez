import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // manage the sum section
  int sum = 0;
  int minus = 0;
  int multiply = 0;
  int divide = 0;

  // either use a TextEditingController for each input field to get the value
  TextEditingController addController1 = TextEditingController();
  TextEditingController addController2 = TextEditingController();
  TextEditingController minusController1 = TextEditingController();
  TextEditingController minusController2 = TextEditingController();
  TextEditingController multiplyController1 = TextEditingController();
  TextEditingController multiplyController2 = TextEditingController();
  TextEditingController divideController1 = TextEditingController();
  TextEditingController divideController2 = TextEditingController();

  // or store each value in the state
  int firstAddNum = 0;
  int secondAddNum = 0;
  int firstMinusNum = 0;
  int secondMinusNum = 0;
  int firstMultiplyNum = 0;
  int secondMultiplyNum = 0;
  int firstDivideNum = 0;
  int secondDivideNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Add Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: addController1,
                  decoration: InputDecoration(labelText: "First Number"),
                  // update the firstAddNum state
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = int.parse(value);
                    });
                  },
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                    controller: addController2,
                    decoration: InputDecoration(labelText: "Second Number"),
                    onChanged: (value) {
                      setState(() {
                        secondAddNum = int.parse(value);
                      });
                    }),
              ),
              Text(' = $sum'),
              IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      sum = firstAddNum + secondAddNum;
                    });
                  })
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: minusController1,
                  decoration: InputDecoration(labelText: "First Number"),
                  // update the firstAddNum state
                  onChanged: (value) {
                    setState(() {
                      firstMinusNum = int.parse(value);
                    });
                  },
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: minusController2,
                  decoration: InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondMinusNum = int.parse(value);
                    });
                  },
                ),
              ),
              Text(' = $minus'),
              IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      minus = firstMinusNum - secondMinusNum;
                    });
                  })
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: multiplyController1,
                  decoration: InputDecoration(labelText: "First Number"),
                  // update the firstAddNum state
                  onChanged: (value) {
                    setState(() {
                      firstMultiplyNum = int.parse(value);
                    });
                  },
                ),
              ),
              const Text(" * "),
              Expanded(
                child: TextField(
                  controller: multiplyController2,
                  decoration: InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondMultiplyNum = int.parse(value);
                    });
                  },
                ),
              ),
              Text(' = $multiply'),
              IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      multiply = firstMultiplyNum * secondMultiplyNum;
                    });
                  })
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: divideController1,
                  decoration: InputDecoration(labelText: "First Number"),
                  // update the firstAddNum state
                  onChanged: (value) {
                    setState(() {
                      firstDivideNum = int.parse(value);
                    });
                  },
                ),
              ),
              const Text(" / "),
              Expanded(
                child: TextField(
                  controller: divideController2,
                  decoration: InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondDivideNum = int.parse(value);
                    });
                  },
                ),
              ),
              Text(' = $divide'),
              IconButton(
                  icon: const Text('÷', style: TextStyle(fontSize: 24.0)),
                  onPressed: () {
                    setState(() {
                      divide = firstDivideNum ~/ secondDivideNum;
                    });
                  })
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                addController1.clear();
                addController2.clear();
                minusController1.clear();
                minusController2.clear();
                multiplyController1.clear();
                multiplyController2.clear();
                divideController1.clear();
                divideController2.clear();
                sum = 0;
                minus = 0;
                multiply = 0;
                divide = 0;
              });
            },
            child: const Text("Clear"),
          ),
        ],
      ),
    );
  }
}
