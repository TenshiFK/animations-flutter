import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animacao/Icon.dart';
import 'package:animacao/Padding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animações no Flutter",
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Color.fromRGBO(2, 66, 46, 1),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(17, 84, 2, 1)),
                child: AnimatedTextKit(
                  animatedTexts: [
                    FadeAnimatedText('Recicle'),
                    FadeAnimatedText('Recicle Agora!!'),
                    FadeAnimatedText('O primeiro passo começa com você'),
                  ],
                ),
              ),
              const SizedBox(height: 50), // Reduzido de 100 para 50
              Row(
                // Novo widget Row para alinhar os botões lado a lado
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnimatedMenuApp()),
                      );
                    },
                    child: Text("Icon"),
                  ),
                  const SizedBox(width: 16), // Espaço entre os botões
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnimatedPaddingExampleApp()),
                      );
                    },
                    child: Text("Padding"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
