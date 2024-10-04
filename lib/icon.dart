import 'package:flutter/material.dart';
import 'package:animacao/Padding.dart';
import 'package:animacao/main.dart'; // Importa o pacote de material design do Flutter.

void main() {
  runApp(
      const AnimatedMenuApp()); // Inicia a aplicação chamando o widget AnimatedMenuApp.
}

class AnimatedMenuApp extends StatelessWidget {
  const AnimatedMenuApp({super.key}); // Construtor do widget AnimatedMenuApp.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define a estrutura básica da aplicação.
      theme: ThemeData(
        colorSchemeSeed:
            const Color.fromARGB(255, 216, 120, 107), // Define a cor do tema.
        useMaterial3: true, // Habilita o uso do Material 3.
      ),
      home: const AnimatedMenuScreen(), // Define a tela inicial da aplicação.
    );
  }
}

class AnimatedMenuScreen extends StatefulWidget {
  const AnimatedMenuScreen(
      {super.key}); // Construtor do widget AnimatedMenuScreen.

  @override
  _AnimatedMenuScreenState createState() =>
      _AnimatedMenuScreenState(); // Cria o estado associado ao widget.
}

class _AnimatedMenuScreenState extends State<AnimatedMenuScreen>
    with SingleTickerProviderStateMixin {
  // Gerencia o estado do widget.
  late final AnimationController _animationController = AnimationController(
    // Controlador de animação.
    vsync: this, // Necessário para otimizar a animação.
    duration: const Duration(
        milliseconds: 500), // Duração da animação de 500 milissegundos.
  );

  bool _isMenuOpen = false; // Indica se o menu está aberto.

  @override
  void dispose() {
    _animationController
        .dispose(); // Libera os recursos do controlador ao descartar o estado.
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      // Atualiza o estado do widget.
      // Alterna a animação e o estado do menu.
      _isMenuOpen
          ? _animationController.reverse()
          : _animationController.forward();
      _isMenuOpen = !_isMenuOpen; // Atualiza o estado do menu.
    });
    // Abre o Drawer quando o menu for clicado.
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Define a estrutura básica da tela.
        appBar: AppBar(
          // Cria uma barra de aplicativo.
          title: const Text('Menu Hambúrguer Animado'), // Título da AppBar.
          backgroundColor: const Color.fromARGB(
              255, 171, 151, 226), // Cor de fundo da AppBar.
          leading: IconButton(
            // Botão à esquerda da AppBar.
            onPressed: _toggleMenu, // Chama _toggleMenu ao pressionar o botão.
            icon: AnimatedIcon(
              // Cria um ícone animado.
              icon: AnimatedIcons.menu_close, // Define o tipo de ícone animado.
              progress:
                  _animationController, // Passa o controlador de animação.
              semanticLabel: 'Menu', // Rótulo semântico para acessibilidade.
            ),
          ),
        ),
        // drawer: Drawer(
        //   // Cria um menu lateral.
        //   child: ListView(
        //     // Lista de itens no Drawer.
        //     padding: EdgeInsets.zero, // Remove o preenchimento.
        //     children: const [
        //       // Itens da lista no Drawer.
        //       DrawerHeader(
        //         // Cabeçalho do Drawer.
        //         decoration: BoxDecoration(
        //             color: Colors.purple), // Cor de fundo do cabeçalho.
        //         child: Text(
        //           // Texto do cabeçalho.
        //           'Menu',
        //           style: TextStyle(
        //               color: Colors.white, fontSize: 24), // Estilo do texto.
        //         ),
        //       ),
        //       ListTile(
        //           leading: Icon(Icons.home),
        //           title: Text('Home')), // Item da lista: Home.
        //       ListTile(
        //           leading: Icon(Icons.settings),
        //           title: Text('Settings')), // Item da lista: Settings.
        //       ListTile(
        //           leading: Icon(Icons.contacts),
        //           title: Text('Contact')), // Item da lista: Contact.
        //     ],
        //   ),
        // ),
        body: Column(children: <Widget>[
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
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaPrincipal()),
              );
            },
            child: Text("Home"),
          ),
        ]));
  }
}
