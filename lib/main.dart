import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int num1, num2;
  String result, operator, textToDisplay = '';

  Widget setNumberButton(String btnVal) {
    return RawMaterialButton(
      onPressed: () => btnClicked(btnVal),
      child: Text(
        btnVal,
        style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w500),
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.black45,
      padding: const EdgeInsets.all(15.0),
    );
  }

  Widget setOperatorButton(String btnVal) {
    return RawMaterialButton(
      onPressed: () => btnClicked(btnVal),
      child: new Text(
        btnVal,
        style: TextStyle(
            fontSize: 35.0,
            color: Colors.red[700],
            fontWeight: FontWeight.w500),
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.white,
      highlightColor: Colors.red[100],
      splashColor: Colors.red[100],
      padding: const EdgeInsets.all(15.0),
    );
  }

  Widget setOperationButton(String btnVal) {
    return new RawMaterialButton(
      onPressed: () => btnClicked(btnVal),
      child: new Text(
        btnVal,
        style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w500),
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.red[700],
      padding: const EdgeInsets.all(15.0),
    );
  }

  void btnClicked(String btnVal) {
    if (btnVal == 'AC') {
      textToDisplay = '';
      result = '';
      num1 = 0;
      num2 = 0;
    } else if (btnVal == '.') {
      clickDot();
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '÷' ||
        btnVal == '±' ||
        btnVal == '%') {
      num1 = int.parse(textToDisplay);
      result = '';
      operator = btnVal;
    } else if (btnVal == '=') {
      num2 = int.parse(textToDisplay);
      if (operator == '+') {
        result = (num1 + num2).toString();
      }
      if (operator == '-') {
        result = (num1 - num2).toString();
      }
      if (operator == 'x') {
        result = (num1 * num2).toString();
      }
      if (operator == '÷') {
        result = (num1 ~/ num2).toString();
      }
      if (operator == '±') {
        setState(() {
          result = '-' + result;
          textToDisplay = result;
        });
      }
      if (operator == '%') {
        double percent = 0.0;
        percent = double.parse(textToDisplay) / 100.0;
        textToDisplay = textToDisplay.toString() + " ÷ 100 =";
        result = percent.toString();
      }
    } else {
      result = int.parse(textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = result;
    });
  }

  void clickDot() {
    setState(() {
      result += ".";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.red[700],
          title: new Image.asset('assets/title.png')),
      body: new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(top: 25.0, right: 15.0),
                child: new Text(
                  textToDisplay,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              new Padding(
                padding:
                    new EdgeInsets.only(top: 15.0, right: 15.0, bottom: 15.0),
                child: new Text(
                  textToDisplay,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w100,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 15.0, left: 5.0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      setOperationButton('AC'),
                      setOperationButton('±'),
                      setOperationButton('%'),
                      setOperatorButton('÷'),
                    ]),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 15.0, left: 5.0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      setNumberButton('1'),
                      setNumberButton('2'),
                      setNumberButton('3'),
                      setOperatorButton('×'),
                    ]),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 15.0, left: 5.0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      setNumberButton('4'),
                      setNumberButton('5'),
                      setNumberButton('6'),
                      setOperatorButton('-'),
                    ]),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 15.0, left: 5.0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      setNumberButton('7'),
                      setNumberButton('8'),
                      setNumberButton('9'),
                      setOperatorButton('+'),
                    ]),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 15.0, left: 5.0, bottom: 6.0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      setNumberButton('0'),
                      setNumberButton('00'),
                      setNumberButton('.'),
                      setOperationButton('='),
                    ]),
              ),
            ]),
      ),
    );
  }
}
