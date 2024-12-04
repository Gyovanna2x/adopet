import 'package:flutter/material.dart';
import 'package:pet_adopt/controller/auth_controller.dart';
import 'package:pet_adopt/view/cadastro_screen.dart';
import 'package:pet_adopt/view/home_screen.dart';
import 'package:pet_adopt/view/pets_screen.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importando SharedPreferences

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authController = AuthController();
  final _formKey = GlobalKey<FormState>();

  // Função para realizar o login
  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;

      final token = await _authController.loginUser(email, password);

      if (token != null) {
        // Armazenar o token com SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token); // Armazenando o token

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login feito com sucesso!")),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const PetsScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Falha ao realizar login, campos invalidos!")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
return SafeArea(
      child: Scaffold(
        backgroundColor:  Color(0xFFB7E0FF), // Set the background to pink
        appBar: AppBar(
          title: const Text("Login de usuário"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor:  Color(0xFFB7E0FF), // Make AppBar background the same pink color
        ),


        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
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
                const Spacer(flex: 4),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, insira um email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Digite seu email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.2), width: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, insira sua senha";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Digite sua senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2), width: 1),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFFBBE),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text(
                        "Entrar",
                        style: TextStyle(fontSize: 18, color: Color(0xFF033A95)),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CadastroScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFFBBE),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(fontSize: 18, color: Color(0xFF033A95)),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
