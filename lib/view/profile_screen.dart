import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token'); // Recupera o token salvo
  }

  Future<List<dynamic>> fetchUserPets() async {
    final token = await _getToken();
    if (token == null) {
      throw Exception('Token não encontrado. Faça login novamente.');
    }

    final response = await http.get(
      Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/pet/mypets'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['pets'] as List<dynamic>;
    } else {
      throw Exception('Erro ao carregar os pets.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  Color(0xFFB7E0FF), // Cor de fundo do Scaffold
        appBar: AppBar(
          backgroundColor:  Color(0xFFB7E0FF), // Cor de fundo do AppBar
          title: const Text("Perfil de Usuário"),
          centerTitle: true,
          automaticallyImplyLeading: false, // Remove o botão de voltar padrão
        ),
        body: Container(
          color: Color(0xFFB7E0FF), // Cor de fundo para o corpo inteiro
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Botão Voltar estilizado
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Voltar à tela anterior
                },
                child: Container(
                  margin: EdgeInsets.only(
                      right: 1, bottom: 80), // Ajusta os valores conforme necessário
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chevron_left, 
                        color: Colors.black,
                        size: 40, 
                      ),
                      SizedBox(height: 100), 
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Fundo transparente
                  shadowColor: Colors.transparent, // Remove a sombra
                  elevation: 0, // Remove elevação
                  padding: EdgeInsets.zero, // Remove padding
                ),
              ),
              const Spacer(flex: 2),
              // Nome do usuário
              Center(
                child: Column(
                  children: [
                    // Placeholder para imagem de perfil
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black12,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const SizedBox(height: 10),
                    const Text(
                      "example@example.com",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Descrição do usuário
              const SizedBox(height: 10),

              const Spacer(flex: 2),
              const Text(
                "Pets Cadastrados",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: fetchUserPets(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erro: ${snapshot.error}'));
                    } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("Você não cadastrou nenhum pet ainda."),
                      );
                    } else {
                      final pets = snapshot.data!;
                      return ListView.builder(
                        itemCount: pets.length,
                        itemBuilder: (context, index) {
                          final pet = pets[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(pet['images'][0]),
                            ),
                            title: Text(pet['name']),
                            subtitle: Text(
                                "Idade: ${pet['age']} anos | Peso: ${pet['weight']}kg"),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
