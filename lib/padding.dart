import 'package:flutter/material.dart';

/// Flutter code sample for [AnimatedPadding].

void main() => runApp(const AnimatedPaddingExampleApp());

class AnimatedPaddingExampleApp extends StatelessWidget {
  const AnimatedPaddingExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Reciclagem", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const AnimatedPaddingExample(),
      ),
    );
  }
}

class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  double padValue = 00.0;

  final Map<String, AssetImage> _opcoesImagem = {
    "lata": AssetImage("assets/lata.png"),
    "lataAmassada": AssetImage("assets/lataAmassada.png"),
  };

  var _imagem = AssetImage("assets/lata.png");

  void _updatePadding(double value) {
    setState(() {
      padValue = value;
      this._imagem = AssetImage("assets/lataAmassada.png");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Padding: $padValue'),
        ElevatedButton(
            child: const Text('Recicle!'),
            onPressed: () {
              _updatePadding(padValue == 300.0 ? 0.0 : 300.0);
            }),
        AnimatedPadding(
          padding: EdgeInsets.only(top: padValue, bottom: padValue),
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          child: Container(
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Expanded(
          // your image goes here which will take as much height as possible.
          child: Image(image: _imagem, fit: BoxFit.contain),
        ),
        AnimatedPadding(
          padding: EdgeInsets.only(top: 0, bottom: 0),
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          child: Container(
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}
