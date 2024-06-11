
import 'package:ecommerce/pages/home_page_screen.dart';
import 'package:ecommerce/pages/password_recovery_screen.dart';
import 'package:ecommerce/pages/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 20), // Ajuste o valor do padding conforme necessário
          child: Container(
            height: MediaQuery.of(context).size.height, // Adjust height to screen size
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey[300]!, Colors.grey[100]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  'lib/images/logo.png',
                  width: 200,
                ),
                const SizedBox(height: 70),
                const Text(
                  'Bem-vindo(a) De Volta!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Lógica de validação do login aqui
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    _login(email, password, context);
                  },
                  child: const SizedBox(
                    width: 295,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PasswordRecoveryScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Esqueceu a senha? Clique aqui',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Novo Cadastro',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 65, 243, 33),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(), // Adicionar um container vazio para ocupar o espaço restante
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login(String email, String password, BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Erro'),
            content: const Text('Preencha todos os campos'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Usuário logado com sucesso
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Sucesso'),
              content: const Text('Login realizado com sucesso'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } catch (error) {
        // Ocorreu um erro durante o login
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Erro'),
              content: Text(
                'Falha no login. Verifique os dados informados: $error',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
