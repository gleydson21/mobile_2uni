import 'package:flutter/material.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/pages/intro_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'utils/logger.dart'; // Importe o arquivo de configuração do logger

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure o logger antes de inicializar o Firebase
  setupLogger();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroScreen(),
      ),
    );
  }
}
