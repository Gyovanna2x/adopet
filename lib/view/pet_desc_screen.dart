import 'package:flutter/material.dart';
import 'package:pet_adopt/model/pet_model.dart';

class PetDescScreen extends StatelessWidget {
  final PetModel dog;

  const PetDescScreen({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Botão de voltar
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Container(
      padding: const EdgeInsets.only(right: 150.0),
      child: Icon(
        Icons.chevron_left,
        color: Colors.black,
        size: 40.0, // Tamanho do ícone
      ),
    ),
  ],
),
              ),
              // Imagem do pet ocupando uma proporção menor da tela
              SizedBox(
                height: 380,
                width: double.infinity,
                child: Image.network(
                  dog.imageUrl, // Supondo que o PetModel tenha o campo imageUrl
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              // Nome do animal centralizado e em negrito
              Center(
                child: Text(
                  dog.name, // Exibe o nome do animal
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Linha com 3 quadrados de informações
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Primeiro quadrado: Idade
                  Container(
                    width: 90, // Ajuste da largura
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFB7E0FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Idade",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "${dog.age} anos", // Exibe a idade do pet
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Segundo quadrado: Peso
                  Container(
                    width: 90,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:Color(0xFFB7E0FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Peso",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "${dog.weight} kg", // Exibe o peso do pet
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Terceiro quadrado: Sexo
                  Container(
                    width: 90,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:Color(0xFFB7E0FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Sexo",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          dog.gender, // Exibe o sexo do pet
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Título descrição
              const Text(
                "Descrição",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Descrição do animal
              Text(
                dog.description, // Exibe a descrição do pet
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              // Botões de Adoção e Favoritar
              Row(
                children: [
                  // Botão "Adotar" ocupa quase todo o espaço da linha
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Ação de adotar
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color(0xFFFFFBBE),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10), // Mantido o tamanho do padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Adotar",
                        style: TextStyle(
                          fontSize: 14,
                          color:Color(0xFF033A95),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Espaço entre os botões
                  ElevatedButton(
                    onPressed: () {
                      // Ação de favoritar
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Color(0xFFFFFBBE),
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child:
                        const Icon(Icons.favorite_outline, color: Color(0xFF033A95)),
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
