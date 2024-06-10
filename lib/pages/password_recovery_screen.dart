 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordRecoveryScreenState createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final TextEditingController _emailController = TextEditingController();
  late BuildContext _scaffoldContext;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar de senha'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          _scaffoldContext = context;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () {
                          String email = _emailController.text;
                          _sendRecoveryEmail(email);
                        },
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Enviar email de recuperação'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _sendRecoveryEmail(String email) async {
    setState(() {
      _isLoading = true;
    });

    try {
         await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      //   Email de recuperação enviado com sucesso
      showDialog(
        // ignore: use_build_context_synchronously
        context: _scaffoldContext,
        builder: (context) => AlertDialog(
          title: const Text('Sucesso'),
          content: const Text('Email de recuperação enviado'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (error) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: _scaffoldContext,
        builder: (context) => AlertDialog(
          title: const Text('Erro'),
          content: Text('Falha no envio do email de recuperação: $error'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}