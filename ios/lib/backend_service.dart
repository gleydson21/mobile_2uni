import 'dart:convert';
import 'package:http/http.dart' as http;
import 'utils/logger.dart';

class BackendService {
  static const String _baseUrl = 'http://10.0.2.2:5000/'; // Substitua pelo IP da sua máquina se não estiver usando um emulador

  static Future<bool> addVendas(List<Map<String, dynamic>> vendas) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/vendas'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'vendas': vendas}),
      );
      if (response.statusCode == 201) {
        logger.info('Vendas adicionadas com sucesso');
        return true;
      } else {
        logger.warning('Falha ao adicionar as vendas. Código de status: ${response.statusCode}');
        throw Exception('Falha ao adicionar as vendas.');
      }
    } catch (e) {
      logger.severe('Erro de conexão: $e');
      throw Exception('Erro de conexão: $e');
    }
  }
}
