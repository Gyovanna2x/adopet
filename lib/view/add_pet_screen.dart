import 'package:flutter/material.dart';
import 'package:pet_adopt/controller/pet_controller.dart';

class AddPetScreen extends StatelessWidget {
  AddPetScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PetController petController = PetController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adicionar Pet para adoção"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                ),
                 child: Container(
  margin: EdgeInsets.only(
      right: 1, bottom: 80), // Adjust the values as needed
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
              ),
              const Spacer(flex: 2),
              _buildTextField(nameController, "Nome do Pet"),
              const SizedBox(height: 15),
              _buildTextField(ageController, "Idade do Pet",
                  keyboardType: TextInputType.number),
              const SizedBox(height: 15),
              _buildTextField(weightController, "Peso do Pet (kg)",
                  keyboardType: TextInputType.number),
              const SizedBox(height: 15),
              _buildTextField(colorController, "Cor do Pet"),
              const SizedBox(height: 15),
              _buildTextField(imageController, "URL da Imagem do Pet"),
              const Spacer(flex: 3),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await petController.addPet(
                        name: nameController.text,
                        age: int.parse(ageController.text),
                        weight: double.parse(weightController.text),
                        color: colorController.text,
                        images: [imageController.text],
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Pet cadastrado com sucesso!')),
                      );
                      Navigator.of(context).pop();
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Erro: $e')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFBBE),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Adicionar Pet",
                    style: TextStyle(
                      fontSize: 18,
                      color:  Color(0xFF033A95),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint,
      {TextInputType? keyboardType}) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xFFFFFBBE),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
