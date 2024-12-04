import 'package:flutter/material.dart';
import 'package:pet_adopt/view/cadastro_screen.dart';
import 'package:pet_adopt/view/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Color(0xFFB7E0FF), // Cor de fundo igual ao primeiro código
        body: Stack(
          children: [
            // Conteúdo da tela (imagem, texto e botões)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centraliza os itens na vertical
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Centraliza os itens na horizontal
                children: [
                  const SizedBox(height: 40), // Para dar espaço no topo
                  // Centralizando a imagem e o texto "Me adote!"
                  Center(
                    child: Stack(
                      clipBehavior: Clip
                          .none, // Permite que o texto fique fora do círculo
                      children: [
                        Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/cachorro.png", // Imagem do cachorro
                              width: 250,
                              height: 250,
                              fit: BoxFit.cover, // Ajuste da imagem
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20, // Move o texto para fora do círculo
                          left: 175,
                          child: Text(
                            'Me adote!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFBBE), // Cor do texto
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Título da aplicação ajustado para o design
                  const Text(
                    "Faça um novo Aumigo",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Adote um Pet hoje!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40), // Espaço entre o texto e o botão
                  // Botão de "Iniciar" atualizado com o design
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CadastroScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFFBBE), // Cor do botão
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Let's Go",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF033A95), // Cor do texto do botão
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            // Botão "Pular" fixo no topo
            Positioned(
              top: 10,
              right: 10,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                      right: 5, top: 1), // Adjust the values as needed
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chevron_right,
                        color: Colors.black,
                        size:
                            40, // Adjust this value to make the icon bigger or smaller
                      ),
                      SizedBox(
                          height:
                              100), // You may want to adjust the SizedBox as well if needed
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
