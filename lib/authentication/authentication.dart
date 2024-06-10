import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> cadastrarUsuario({
    required String name,
    required String email,
    required String password,
  }) {
    return _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password)
        .then((userCredential) {
      // O usuário foi criado com sucesso
      // Você pode adicionar aqui qualquer lógica adicional após o cadastro do usuário, como salvar o nome
      // ou enviar um e-mail de verificação para o usuário, se necessário.
      // Exemplo: salvar o nome do usuário
      User? currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        currentUser.updateDisplayName(name);
      }
    }).catchError((error) {
      // Ocorreu um erro durante o cadastro do usuário
      // Você pode tratar os erros específicos aqui, caso deseje
      if (kDebugMode) {
        print('Erro durante o cadastro do usuário: $error');
      }
    });
  }
}