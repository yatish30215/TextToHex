import 'dart:core';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // the result which will be displayed on the screen
  var _result = '';

  // Create a text controller to retrieve the value
  final _myController = TextEditingController();

  // the function which converts
  void _convert() {
    debugPrint(_myController.text);

    setState(() {
      _result = '';
      for (int rune in _myController.text.runes) {
        var character = String.fromCharCode(rune);
        _result = _result + character.codeUnitAt(0).toRadixString(16);
      }
      FocusManager.instance.primaryFocus?.unfocus();
    });

    debugPrint(_result);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    _myController.dispose();
    super.dispose();
  }

  void _clear() {
    setState(() {
      _result = '';
      _myController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Text to Hex Application'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Image(image: AssetImage('assets/vara logo 1.png')),

              const SizedBox(height: 30),

              const Text(
                'Please enter your input',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 30),
              // The user will type something here
              TextField(
                controller: _myController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Type in your input",
                    suffixIcon: IconButton(
                      onPressed: _myController.clear,
                      icon: const Icon(Icons.clear),
                    ),
                    fillColor: Colors.white70),
              ),

              // add some space
              const SizedBox(height: 30),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _convert,
                      child: const Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 7, 81, 219),
                        onPrimary: Colors.white,
                        shadowColor: const Color.fromARGB(255, 105, 179, 240),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        minimumSize: const Size(100, 50), //////// HERE
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _clear,
                      child: const Text('Clear'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 190, 11, 11),
                        onPrimary: Colors.white,
                        shadowColor: const Color.fromARGB(255, 240, 105, 105),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        minimumSize: const Size(100, 50), //////// HERE
                      ),
                    ),
                  ],
                ),
              ),

              // add some space
              const SizedBox(height: 40),

              // Display the result
              const Text('Your Converted Output is \n '),
              Text(
                _result,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
