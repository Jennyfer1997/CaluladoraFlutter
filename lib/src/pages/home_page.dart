import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size _size;
  String equation = "0", result = "0";
  Map<String, String> operatorsMap = {"÷": "/", "×": "*", "−": "-", "+": "+"};
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blueAccent,
      body: _body(),
    );
  }

  void evaluateEquation() {
    try {
      // Fix equation
      Expression exp = (Parser()).parse(operatorsMap.entries.fold(
          equation, (prev, elem) => prev.replaceAll(elem.key, elem.value)));

      double res = double.parse(
          exp.evaluate(EvaluationType.REAL, ContextModel()).toString());

      // Output correction for decimal results
      result = double.parse(res.toString()) == int.parse(res.toStringAsFixed(0))
          ? res.toStringAsFixed(0)
          : res.toStringAsFixed(4);
    } catch (e) {
      result = "Error";
    }
  }

  Widget _buttonPressed(String text, {bool isClear = false}) {
    setState(() {
      if (isClear) {
        // Reset calculator
        equation = result = "0";
      } else if (text == '=') {
        if (!operatorsMap.containsKey(equation.substring(equation.length - 1)))
          evaluateEquation();
      } else if (text == "⌫") {
        // Backspace
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") equation = result = "0"; // If all empty
      } else {
        // Default
        if (equation == "0" && text != ".") equation = "";
        equation += text;
      }

      // Only evaluate if correct expression
    });
  }

  Widget _body() {
    print(result);
    return Stack(
      //alignment: Alignment.center,
      children: [
        SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(top: _size.height * 0.06),
            // alignment: Alignment.centerRight,
            child: Text(
              equation,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .apply(color: Colors.white),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: _size.height * 0.25),
          color: Colors.white,
          height: _size.height * 0.75,
          width: _size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('+');
                      },
                      child: Text(
                        '+',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('-');
                      },
                      child: Text(
                        '-',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('*');
                      },
                      child: Text(
                        'x',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('/');
                      },
                      child: Text(
                        '/',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 4),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('1');
                      },
                      child: Text(
                        '1',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('2');
                      },
                      child: Text(
                        '2',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('3');
                      },
                      child: Text(
                        '3',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('4');
                      },
                      child: Text(
                        '4',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('5');
                      },
                      child: Text(
                        '5',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('6');
                      },
                      child: Text(
                        '6',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('7');
                      },
                      child: Text(
                        '7',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('8');
                      },
                      child: Text(
                        '8',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('9');
                      },
                      child: Text(
                        '9',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('.');
                      },
                      child: Text(
                        '.',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _buttonPressed('0');
                      },
                      child: Text(
                        '0',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.blueAccent),
                      ),
                    ),
                    FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          _buttonPressed("⌫");
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.blueAccent,
                        )),
                  ],
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    onPressed: () {
                      _buttonPressed("=", isClear: true);
                    },
                    child: Text(
                      'AC',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .apply(color: Colors.blueAccent, fontSizeFactor: 1.3),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _buttonPressed("=");
                      if (result != "Error") {
                        equation = result;
                      }
                    },
                    child: Text(
                      '=',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .apply(color: Colors.blueAccent, fontSizeFactor: 2),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
