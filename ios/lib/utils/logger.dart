import 'package:logging/logging.dart';

final Logger logger = Logger('AppLogger'); // Defina a variável logger antes da chamada da função setupLogger

void setupLogger() {
  Logger.root.level = Level.ALL; // Defina o nível de logging desejado
  Logger.root.onRecord.listen((LogRecord rec) {
    // Substitua o print pelo método de log do logger
    logger.log(rec.level, '${rec.time}: ${rec.message}');
  });
}
